local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"
        use {'sainnhe/gruvbox-material', opt = true}

        -- lsp
        use {"neovim/nvim-lspconfig", opt = true}
        use {"glepnir/lspsaga.nvim", opt = true}
        use {"kabouzeid/nvim-lspinstall", opt = true}

        -- Telescope
        use {"airblade/vim-rooter", opt = true}
        use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true}
        use {"nvim-telescope/telescope.nvim", opt = true}
        use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"windwp/nvim-ts-autotag", opt = true}

        -- Status Line and Bufferline
        use {"kyazdani42/nvim-web-devicons", opt = true}
        use {"glepnir/galaxyline.nvim", opt = true}
        use {"romgrk/barbar.nvim", opt = true}

        -- MISC
        use {"liuchengxu/vista.vim", opt = true}
        use {"lewis6991/gitsigns.nvim", opt = true}
        use {"windwp/nvim-autopairs", opt = true}
        use {"terrortylor/nvim-comment", opt = true}
        use {"kevinhwang91/nvim-bqf", opt = true}
        use {"folke/which-key.nvim", opt = true}
        use {"kyazdani42/nvim-tree.lua", opt = true}





        require_plugin('gruvbox-material')

        -- lsp
        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")

        -- Telescope
        require_plugin("vim-rooter")
        require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        require_plugin("telescope.nvim")
        require_plugin("telescope-fzy-native.nvim")

        -- Treesitter
        require_plugin("nvim-treesitter")
        require_plugin("nvim-ts-autotag")

        -- Status Line and Bufferline
        require_plugin("nvim-web-devicons")
        require_plugin("galaxyline.nvim")
        require_plugin("barbar.nvim")

        -- MISC
        require_plugin("vista.vim")
        require_plugin("gitsigns.nvim")
        require_plugin("nvim-autopairs")
        require_plugin("nvim-comment")
        require_plugin("nvim-bqf")
        require_plugin("which-key.nvim")
        require_plugin("nvim-tree.lua")
    end
)