---
name: app-architecture
description: Use when starting a React or React Native project, or making changes that add features, state, or data flow.
---

# App architecture

Read the repository's architecture README, domain interfaces, schema, and layer config before editing. Take project-specific names, ownership, and allowed imports from those files.

## Keep four layers

```text
View → State → Core → Data access → source of truth
```

Keep all four layers in every app. Imports go down one layer at a time. Reads and writes follow that path; results return through it.

| Layer | Owns |
|---|---|
| View | Routes, screens, components, and platform bindings. Read atoms, draw, and send actions. |
| State | Query and command atoms, presentation derivation, preferences, and shared UI state. No React imports. |
| Core | Domain rules, service interfaces, and adapters. No React imports. |
| Data access | Generic execution, connections, write ordering, transactions, migrations, drivers, authentication, retries, database-wide constraints, and change notifications. No domain rules or queries, except migrations. |

Group code by feature or domain, then by layer. Keep shared utilities independent of all layers. Declare allowed cross-domain dependencies in the layer config; depend on interfaces, never another domain's adapter.

Build one runtime at the composition root. Supply dependencies there, wait for startup readiness, and start scoped background jobs. Dispose the runtime at shutdown. Start no work at import time.

## Use this stack

Check installed versions and matching documentation before using APIs or adding dependencies.

| Concern | Choice |
|---|---|
| Language | TypeScript with strict checks |
| Core | Effect v4 services, `Layer` adapters, tagged errors, and scoped fibers |
| Runtime | Effect `ManagedRuntime` |
| State | Effect Atom; `@effect/atom-react` bindings only in View. Match compatible package versions. |
| Change signal | One shared Effect `Reactivity` service |
| Local data | SQLite; `expo-sqlite` on React Native and `bun:sqlite` in tests |
| Server data | Effect `HttpClient` |
| Boundary decoding | Effect `Schema` |
| Routing | Expo Router on React Native; TanStack Router on web. Enable typed routes. Routes read State. |
| Memoization | React Compiler; no manual `useMemo` or `useCallback` |
| Checks | Biome, dependency-graph tests, and `bun test`. Maestro on React Native; Playwright on web. |

## Place logic once

- Keep business rules in Core and presentation derivation in State. Test pure gesture and motion rules beside their components.
- Keep SQL and domain API requests in the owning domain's adapter. Domain logic uses its service interface; Data access executes the request.
- Access another domain's data through its interface or published read-only query fragment. Combine independent domain results in State.
- Give each transaction one domain owner. Other domains join through a callback supplied by that owner.
- Keep source data in its source of truth. Derive query results; never copy them into component state.
- Keep loading, errors, and command outcomes as values in State. Show a write as saved after success, or show it as pending.
- Keep hooks as bindings to atoms, routing, and platform APIs. Put no shared state or decisions in hooks.
- Keep unshared field and menu state local. Keep animation progress, gesture positions, and scroll offsets out of shared atoms.
- Run I/O, timers, and background work through commands, services, or scoped jobs. Never write state during render.
- Give async work its initiating screen, sheet, or load identity. Check that identity before applying results or callbacks.

## Notify after commit

Core declares each read's dependency keys and each write's changed keys. Keys identify resources or records; Data access treats them as opaque labels.

After a successful commit, Data access invalidates the write's keys through the shared `Reactivity` service. A transaction collects its statements' keys and invalidates them once after commit. Rollbacks emit nothing.

State subscribes to the keys exposed by Core and re-reads through Core when they change. State never imports Data access. The notification carries keys only.

Use one connection manager, write queue, migration history, and change service per local database.

## Add data sources at the edges

- For server data, add an API adapter in Data access. State owns pending, failed, and retry states. Use optimistic updates only when latency warrants them.
- For real-time data, feed server change keys into the same notification service.
- For sync, keep the local database as the app's source of truth. A background job writes through Data access; Core owns conflict rules.
- For push notifications, start a command from the platform entry point at the composition root.

## Enforce and verify

For recurring corrections, follow [Encode lessons in structure](https://raw.githubusercontent.com/cursor/plugins/main/pstack/skills/principle-encode-lessons-in-structure/SKILL.md).

- Define layer and domain ownership in one config. Enforce it with Biome and a graph test over resolved imports, including aliases and platform files. Check whole feature folders to catch bypasses through helpers.
- Restrict UI imports to View and data-client imports to domain adapters and Data access. Restrict app-runtime imports and execution to State and the composition root.
- Require keys in the write API. Verify table ownership and key coverage against SQL.
- For existing violations, freeze a baseline. Reject new violations and remove resolved entries. Fix inaccurate rules without admitting code that breaks the architecture.
- Test Core through service layers over real storage or a test adapter. Test State through the atom registry without rendering.
- Verify that committed writes refresh only matching queries, rollbacks refresh none, and stale async results cannot apply.
- Run the repository's check command. Verify View behavior end to end on each supported platform when behavior changes.
