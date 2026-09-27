-- Toggle animations globally and define custom curves (easeOutQuint, easeInOutCubic, linear, almostLinear, quick) using hl.config() and hl.curve()
hl.config({ animations = { enabled = true } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
-- ... [Refer to web document 2.1.1 and 2.2.2 for complete curve and animation mapping definitions including global, border, windows, fades, layers, and workspaces]
