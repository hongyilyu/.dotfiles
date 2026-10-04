---
name: app-architecture
description: Use when starting a React or React Native project, or making changes that add features, state, or data flow.
---

# App Architecture

The layered model for React and React Native apps, whatever the data source: local-first, server-backed, real-time, or synced. Use it to start a project, to decide where new code goes, and to review changes. If a change breaks a rule, say which rule and why before you make it.

## The model

```
View          screens and components: read state, draw, send actions
 ↕
State     ◀───────────┐  change signal: keys only, never data
 ↕                    │
Core (domains)        │  domains decide the keys
 ↕                    │
Data access ──────────┘  fires a write's keys once it lands
 ↕
Source of truth: local DB · server API · sync engine
```

- **Dependencies point down only.** No layer imports one above it, skips one below it, or reaches sideways into another feature, except through an explicit list of allowed pairs.
- **Data travels down and back up the same path.** A read goes View → State → Core → Data access, and its result returns the same way.
- **The change signal travels back up directly.** It carries only keys: labels naming what changed, such as a table (`orders`) or one record in it (`order:42`, the order whose id is 42). When State hears its keys, it re-reads through Core along the normal path. The signal is a shared runtime service, like a clock or a logger. State takes the keys from Core and never imports Data access.
- **Shared utilities** (`lib`) may be used by every layer and import nothing from any layer.
- **A composition root** at startup builds the runtime and its services, runs readiness gates before the first frame, and starts background work. Everything else receives its dependencies, so tests can swap them.

## The stack

Use these unless the project has already chosen otherwise. Check each library's current major version and docs before installing.

| Concern | Use | Notes |
|---|---|---|
| Language | TypeScript, strict | |
| Core: domains, workflows, errors, dependency injection | **Effect v4** | Each domain interface is a `Context.Service`, and each adapter is a `Layer`. Errors are tagged (`Schema.TaggedError`). Background work runs as fibers. |
| Composition root | Effect `ManagedRuntime` built from every `Layer` | One runtime per app, built at startup, never when a file is imported. |
| State | **Effect Atom** (`effect/unstable/reactivity` `Atom`, plus `@effect/atom-react` in the View) | Queries are `runtime.atom(...)`. Commands are `runtime.fn(...)`. Preferences and UI state are writable atoms. Tests use `AtomRegistry`, with no rendering. Version-match `@effect/atom-react` to `effect`. |
| Change signal | Effect **`Reactivity`** | Writes go through `Reactivity.mutation(keys, effect)` or `invalidate(keys)` after commit. Query atoms use `withReactivity(keys)`. It's provided once, as a runtime service. |
| Data access, local | SQLite: `expo-sqlite` on React Native, wrapped as an Effect service with one write queue and migrations | A second driver over `bun:sqlite` for tests. |
| Data access, server | Effect `HttpClient` (or `HttpApi` with a shared schema) as an Effect service | Retries, auth, and decoding through `Schema` in this layer. |
| Validation and decoding | Effect `Schema` | At every boundary: storage rows, HTTP bodies, stored preferences. |
| Routing, React Native | **Expo Router** | File-based routes in `app/`, typed routes on. |
| Routing, web | **TanStack Router** | Typed routes; loaders read State, not the network. |
| Memoization | React Compiler, on | No hand-written `useMemo` or `useCallback`. |
| Tests | `bun test` for Core and State; Maestro end to end on React Native, Playwright on web | |
| Lint, format, and layer enforcement | **Biome** | Layer imports through `noRestrictedImports` in per-folder `overrides`; custom rules as GritQL plugins; plus a dependency-graph test. See Enforcement. |


## What each layer holds

**View**
- Routes, screens, components, and platform adapters: web views, gestures, animation, the router.
- Reads state and sends actions. It doesn't fetch, run queries, catch domain errors, or start background work.
- Fast-path UI state stays local: animation progress, gesture position, and scroll offset live on the UI thread (Reanimated in React Native). Pure gesture and motion rules sit beside their components as pure functions.
- Short-lived UI state can stay in `useState`, such as whether a menu is open or what's typed in a field. Promote it only when another component, a background task, or a test needs it.
- Hooks are glue only: they connect a component to atoms, the router, and platform APIs. Hooks hold no shared state and no decisions.

**State**
- Effect Atom atoms outside React. The View binds them with `useAtomValue`, `useAtomSet` and `useAtom` from `@effect/atom-react`.
- **Queries:** a domain read plus the keys it depends on. A query re-runs only when one of its keys changes.
- **Commands:** run a domain action and return a tagged outcome, for example `Saved | NameTaken | Failed`.
- **Derived values:** titles, counts, filtered and grouped rows, empty states.
- **Shared UI state:** selection, filters, open panels, scroll place.
- Imports no React, so it's tested without rendering.

**Core (domains)**
- One module per domain. Each owns its rules and its data, and depends on the domains it needs only through their interfaces.
- Each domain has three parts:
  - **Rules:** pure logic.
  - **An interface:** in the domain's own words, such as `listOrders` or `cancelOrder`.
  - **An adapter:** implements the interface against Data access, holds the domain's SQL or API calls, and touches only its own tables or endpoints.
- Domain logic depends on its interface, never on the database or HTTP client directly.
- Each write names the keys it changes, and each read declares the keys it depends on. Keys are table or resource names, plus row keys where a screen reads one row.
- **Transactions:** each belongs to one domain. Another domain joins through a callback the owner passes in.
- **Cross-domain reads:** go through a read-only fragment or view the owning domain publishes, or are combined in State. Never name another domain's tables.
- Imports no UI framework.

**Data access**
- Thin and generic: it executes what domains hand it, and knows no domain's tables, rules, or meaning.
- It owns the hard parts every domain would otherwise repeat:
  - the connection or client;
  - write ordering (one write queue for local databases);
  - transactions;
  - migrations;
  - retries and auth (for a server);
  - drivers for each platform and for tests;
  - database-wide rules, such as foreign keys and busy timeouts;
  - firing a write's keys after it commits, and never on a rollback.
- Keys are opaque labels to it.
- Use one instance per source of truth. Two write queues or two migration lists over the same database collide.

## Data sources plug in at the edges

The four layers stay the same for every kind of app. What changes is what sits at the bottom, and where change signals come from.

| App | Source of truth | What's added | Where it goes |
|---|---|---|---|
| Local-first | Local database | Nothing extra | Data access holds the database |
| Server-backed | Server | An `HttpClient` service; query atoms over it, keyed through `Reactivity` | Data access; State |
| Real-time | Server, pushed to the client | Server events fire keys into the same signal | Data access |
| Synced (offline and multi-device) | Local database, synced | A sync engine writing through Data access; conflict rules | Background job; rules in Core |
| Push notifications | — | A handler that starts a command, as a tap would | Composition root |

Once the network is involved, two things reach up through the layers. Design them in from the start:

1. **Writes are slow and can fail.**
   - State needs pending, failed, and retry states for every command.
   - Use optimistic updates only where a write is slow; local database writes rarely need them.
   - A control shows a choice as saved only once it is saved, or marks it pending until then.
2. **Two copies of the truth can disagree.** With sync, the device and the server can both change the same record. Conflict rules are domain logic and belong in Core. A sync engine applies them, but it can't decide them for you.

## Rules

1. **One source of truth.** Never copy source data into component state; derive from it.
2. **Logic leaves the view.**
   - Business rules go in Core.
   - Presentation derivation goes in State.
   - Components only draw.
3. **One-way flow.** Action → command → write → only the queries on the changed keys re-run → re-render. Don't use two-way binding, and don't write state during a render.
4. **Side effects run in commands, domain services, or background jobs.** That includes network calls, timers, file I/O, and work started at import time. Don't scatter them through component effects.
5. **Loading, errors, and outcomes are values.** Components branch on them instead of keeping their own flags or catching errors.
6. **Organize by feature, then by layer.** Group code by feature or domain, not by file type.
7. **Every app has all four layers, however small.** Within a layer, don't add modules that only forward calls; they cost something and hide nothing.
8. **Async results apply only while what started them is still current**, such as the same screen, sheet, or load. Give each request an identity and check it where the result lands.


## Enforcement

Prefer, in this order: architecture (make the mistake impossible), types, lint, tests, then review.

- **Layer imports:**
  - Write the layers in one config file.
  - Lint each import against it, and run a dependency-graph test over the resolved imports, so cycles and per-platform files are covered too.
  - Check per feature folder, not per file, so a screen can't reach a lower layer through a helper file beside it.
- **No UI below the View:** lint bans React, React Native UI, the router, and styling imports in State, Core, and Data access.
- **No runtime in views:** lint bans running effects or importing the runtime outside State and the composition root.
- **Only adapters hold SQL or API calls:** value imports of the database or HTTP client are allowed only in adapters and in Data access.
- **Table or resource ownership:** a test maps each table to its domain, and fails when a domain's SQL names another domain's table.
- **Keys:**
  - The write API requires keys, so a write without keys doesn't compile.
  - A test checks that each write's keys cover the tables it writes.
- **Adopting rules in an existing codebase:**
  - Use a ratchet. Add each rule with a baseline list of the files that already break it.
  - Lint fails on any new violation.
  - A test fails when a listed file no longer breaks its rule, so the list only shrinks. Never add entries.
- **Fixing a rule:**
  - If a rule flags code that follows the architecture, or misses code that breaks it, fix the rule and give a one-line reason.
  - Never loosen a rule just to let non-conforming code pass.

## Testing by layer

| Layer | How |
|---|---|
| Core | Through the domain's `Layer` over real SQLite (`bun:sqlite`), or a test `Layer` at Data access |
| State | Through the store or atom registry, with no rendering. Check that a write re-runs only queries on its keys. |
| Pure UI rules | As pure functions |
| View | End to end on device |

## Checklist

**New project**
- [ ] Choose the source of truth: local database, server, or local plus sync.
- [ ] Install the stack above, and decide how keys are named.
- [ ] Write down the layers and domains, which domain owns which tables, and what each domain depends on.
- [ ] Enforce the layer imports with lint and a dependency test from the first commit.
- [ ] Create the composition root: runtime, services, readiness gates, background jobs.
- [ ] Set up tests for Core and State, and an end-to-end tool for the UI.

**Each change**
- [ ] New logic goes in the right layer: a business rule in Core, a derivation in State, drawing in a component.
- [ ] Domain SQL or API calls go only in that domain's adapter, against its own tables.
- [ ] Every write names its keys, and every read declares its keys.
- [ ] No component copies source data into local state.
- [ ] Side effects run through a command, a domain service, or a background job.
- [ ] Loading, errors, and outcomes are returned as values.
- [ ] Network writes have pending, failed, and retry states.
- [ ] New logic is testable without rendering.
- [ ] No new module only passes calls through.
