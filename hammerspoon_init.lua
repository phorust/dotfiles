hs.window.animationDuration = 0
units = {
  right30         = { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
  right50         = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  right70         = { x = 0.30, y = 0.00, w = 0.70, h = 1.00 },
  left70          = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
  left50          = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  left30          = { x = 0.00, y = 0.00, w = 0.30, h = 1.00 },
  top50           = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50           = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upright30       = { x = 0.70, y = 0.00, w = 0.30, h = 0.50 },
  botright30      = { x = 0.70, y = 0.50, w = 0.30, h = 0.50 },
  upleft70        = { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
  botleft70       = { x = 0.00, y = 0.50, w = 0.70, h = 0.50 },
  maximum         = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
  maximumBordered = { x = 0.05, y = 0.05, w = 0.90, h = 0.90 }
}

mash = { 'alt', 'ctrl', 'cmd' }
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximumBordered,    nil, true) end)
