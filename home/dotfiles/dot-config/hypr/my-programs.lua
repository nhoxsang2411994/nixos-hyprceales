local M = {}

M.terminal = "ghostty"
M.fileManager = "yazi"
M.browser = "firefox"
M.editor = "nano"
M.store = "steam"
M.menu = "rofi -show drun"

-- Export these variables globally so your keybindings and scripts can read them
_G.terminal = M.terminal
_G.fileManager = M.fileManager
_G.browser = M.browser
_G.editor = M.editor
_G.store = M.store
_G.menu = M.menu

return M
