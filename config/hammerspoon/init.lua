local hyper = { 'cmd', 'alt', 'ctrl', 'shift' }

hs.hotkey.bind(hyper, 'R', function()
    hs.reload()
end)

hs.alert.show('HS Config loaded')

function bindHyper(key, fn)
    hs.hotkey.bind(hyper, key, fn)
end

function moveCurrentWinToLeftHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end

function moveCurrentWinToRightHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w / 2
    f.y = 0
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end

function moveCurrentWinToRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w - f.w
    f.y = 0

    win:setFrame(f)
end

function moveCurrentWinToLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0

    win:setFrame(f)
end

hs.hotkey.bind(hyper, 'A', function()
    moveCurrentWinToLeftHalf()
end)

hs.hotkey.bind(hyper, 'F', function()
    moveCurrentWinToRightHalf()
end)

hs.hotkey.bind(hyper, 'D', function()
    moveCurrentWinToRight()
end)

hs.hotkey.bind(hyper, 'S', function()
    moveCurrentWinToLeftHalf()
end)

-- center window
hs.hotkey.bind(hyper, 'C', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = (max.w - f.w) / 2
    f.y = 0

    win:setFrame(f)
    
end)

-- max
hs.hotkey.bind(hyper, 'M', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0
    f.w = max.w
    f.y = max.y

    win:setFrame(f)
    
end)

-- increase window size
hs.hotkey.bind(hyper, '=', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x - 10
    f.w = f.w + 20

    if (f.w > max.w) then
        f.w = max.w
    end

    win:setFrame(f)
end)

-- decrease window size
hs.hotkey.bind(hyper, '-', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x + 10
    f.w = f.w - 20

    win:setFrame(f)
end)

hs.window.highlight.ui.frameWidth = 1
hs.window.highlight.ui.overlay = true
hs.window.highlight.start()
hs.hotkey.bind(hyper, 'I', function()
    hs.window.highlight.toggleIsolate()
end)
