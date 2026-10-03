--Default terminal and editor
local apps = {}
apps.terminal = 'ghostty'
apps.editor = os.getenv('EDITOR') or 'vim'
apps.editor_cmd = apps.terminal .. ' -e ' .. apps.editor

--Terminal for menubar
require('menubar').utils.terminal = apps.terminal

return apps


