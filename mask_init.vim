set number


call plug#begin()   "Run PlugInstall after  adding a plugin

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
let g:ctrlp_by_filename = 1 "searching by filename (as opposed to full path)
let g:ctrlp_match_current_file = 1 "include current file
let g:ctrlp_regexp = 1 "full regexp mode
let g:ctrlp_working_path_mode = 'wr' "the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_cmd = 'CtrlPMRU'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:20,results:20'
let g:ctrlp_mruf_relative = 1 "Set this to 1 to show only MRU files in the current working directory

Plug 'https://github.com/github/copilot.vim.git'



" cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" cmp

call plug#end()

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
     window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF


"Use function key for split window management
"
"use F5 to cycle back
nnoremap <F5> <C-W>W

nnoremap <F6> <C-W>w    " use F6 to cycle through split windows
nnoremap <F7> <C-W>r    " use F7 to move windows downwards/rightwards
nnoremap <F8> <C-W>x    " use F8 to exchange window with next one
nnoremap <F9> <C-W>-    " decrease window height
nnoremap <F10> <C-W>+    " increase window height
nnoremap <F11> <C-W><    " decrease window width
nnoremap <F12> <C-W>>    " increse window width

nnoremap <F1> :exe "wincmd H"<CR> " Use F1 to swap the current window to the left
nnoremap <F2> :exe "wincmd L"<CR> " Use F2 to swap the current window to the right


" Unmap from from the standard and map them to move around split windows

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
