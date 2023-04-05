require 'imxyz.options'
require 'imxyz.keymaps'

local new_packer_install = require 'imxyz.plugins'
if new_packer_install then
	print("Restart neovim once all plugins are installed")
	return
end

require 'imxyz.colors'
require 'imxyz.treesitter'
require 'imxyz.mason'
require 'imxyz.lsp'

