hs.hotkey.bind({"cmd", "alt"}, "Return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end)


-- Automatically maximize all new Vim windows.

vim_windows = hs.window.filter.new(false):setAppFilter('MacVim')

vim_windows:subscribe(
  hs.window.filter.windowCreated,
  (function(win, applicationName)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
  end),
  true
)

--  move the mouse up by one pixel and then back down every so often

local timerMove = hs.timer.doEvery(60, function()
  local pos = hs.mouse.getRelativePosition()
  hs.mouse.setRelativePosition({x = pos.x, y = pos.y - 1})
  hs.mouse.setRelativePosition({x = pos.x, y = pos.y})
end)
