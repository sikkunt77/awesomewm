-- Return a table containing all bar modules, with a name attached
-- to each.
return {
    launcher  = require(... .. '.launcher'),
    layoutbox = require(... .. '.layoutbox'),
    taglist   = require(... .. '.taglist'),
    tasklist  = require(... .. '.tasklist')
}
