----------------------------------------------------------------------------------------------------
-- Input Switch 
-- https://dsdshcym.github.io/blog/2017/08/09/use-hammerspoon-to-auto-switch-input-methods/
local function Chinese()
  -- hs.keycodes.setMethod("Pinyin - Simplified")
  hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end

local function English()
  -- hs.keycodes.setLayout("U.S.")
  hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

local function set_app_input_method(app_name, set_input_method_function, event)
  hs.window.filter.new(app_name)
    :subscribe(event, function()
                 set_input_method_function()
              end)
end

twoEvents = {hs.window.filter.windowFocused, hs.window.filter.windowCreated}
set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
set_app_input_method('iTerm2', English, twoEvents)
set_app_input_method('Google Chrome', English, twoEvents)
set_app_input_method('WeChat', Chinese, twoEvents)

----------------------------------------------------------------------------------------------------
-- Load Spoons
spoonList = {
    "SpeedMenu",
    "Calendar",
    "UnsplashZ",
    }

-- Load those Spoons
for _, v in pairs(spoonList) do
    hs.loadSpoon(v)
end
