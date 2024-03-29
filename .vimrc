syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')
 
"""""""""""""""""""""
" Vim configuraions "
"""""""""""""""""""""
  set number
  set mouse=a
  set numberwidth=1
  set showcmd
  set ruler
  set sw=2
  set clipboard+=unnamedplus
  set clipboard=unnamed
  set clipboard+=unnamed
  set clipboard=unnamedplus
  set encoding=UTF-8
  set relativenumber
  set termguicolors
  set laststatus=2
  set nocompatible
  set showmatch
  set nowrap
  set noshowmode
  set t_Co=256  " vim-monokai now only support 256 colours in terminal.

""""""""""""""""""""""
" Shortcouts personal "
""""""""""""""""""""""
  :let mapleader=" "

  :nmap <Leader>s <Plug>(easymotion-s2)
  :nmap <Leader>h :bprevious<CR> 
  :nmap <Leader>l :bnext<CR> 
  :nmap <Leader>q :Bwipeout<CR>
  :nmap <Leader>n :NERDTreeToggle<CR>
  :nmap <Leader>p :Files<CR>
  :nmap <Leader>b :Buffers<CR>
  :nmap <Leader>g :GFiles<CR>
  :nmap <Leader>c :Commits<CR>
  :nmap <Leader>gm <Plug>(git-messenger)
  
"""""""""""""""""""""""""""""""""""""""
" Expandtab from different file types "
"""""""""""""""""""""""""""""""""""""""
  autocmd Filetype php setlocal ts=4 sw=4 expandtab
  autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
  autocmd Filetype vue setlocal ts=2 sw=2 expandtab
  autocmd Filetype json setlocal ts=2 sw=2 expandtab
  autocmd Filetype html setlocal ts=2 sw=2 expandtab
  autocmd Filetype ts setlocal ts=2 sw=2 expandtab
 
""""""""""""""""
" Vim-startify "
""""""""""""""""
  Plug 'mhinz/vim-startify'

  let g:startify_session_autoload = 1

  let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Directorio actual '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Marcadores ']      },
          \ ]

  let g:startify_bookmarks = [
          \ { 'w': '~/Webstin/wispfree-quasar' },
          \ { 'd': '~/Webstin/DengnisR' },
          \ { 's': '~/Webstin/scripts-mikrotik' },
          \ ]
  let g:startify_custom_header = [
	  \ '    ________                                _____         ________ ',
	  \ '    ___  __ \_____ _______ _______ ________ ___(_)___________  __ \',
	  \ '    __  / / /_  _ \__  __ \__  __ `/__  __ \__  / __  ___/__  /_/ /',
	  \ '    _  /_/ / /  __/_  / / /_  /_/ / _  / / /_  /  _(__  ) _  _, _/ ',
	  \ '    /_____/  \___/ /_/ /_/ _\__, /  /_/ /_/ /_/   /____/  /_/ |_|  ',
	  \ '                            /____/                                  ',
	  \]
""""""""""""""""""""""""""
" Color Scheme Global "
""""""""""""""""""""""""""
  colorscheme gruvbox
  let g:airline_theme = 'gruvbox'

  " Monokay
  Plug 'crusoexia/vim-monokai' 
  "let g:monokai_term_italic = 1
  "let g:monokai_gui_italic = 1

  " VS Code Dark
  Plug 'tomasiser/vim-code-dark'

  " Gruvbox
  Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_italic=1
  "set bg=dark

"""""""""""""""""""""""""""""
" Icons files and interface "
"""""""""""""""""""""""""""""
  Plug 'ryanoasis/vim-devicons'
  Plug 'vwxyutarooo/nerdtree-devicons-syntax'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  let g:WebDevIconsOS = 'Darwin'
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1

  let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
  let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

  augroup nerdtreehidetirslashes
    autocmd!
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
  augroup end
  
""""""""""""""""""""""""""
" Global autocomplete Coc"
""""""""""""""""""""""""""
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Coc config
  let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json', 
    \ 'coc-phpactor', 
    \ 'coc-html', 
    \ 'coc-css', 
    \ 'coc-snippets'
    \ ]

  " from readme
  " if hidden is not set, TextEdit might fail.
  set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""
" Langs color scheme "
""""""""""""""""""""""

  " Scheme from React
  Plug 'mlaursen/vim-react-snippets'
  Plug 'mxw/vim-jsx'

  " Scheme from Stylus
  Plug 'wavded/vim-stylus'

  " Scheme from Mikrotik
  Plug 'zainin/vim-mikrotik'

  " Scheme from Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'

  " Scheme from Vue
  Plug 'posva/vim-vue'
  let g:vue_pre_processors = 'detect_on_enter'

"""""""""""""""""""""
" Fuzzy file finder "
"""""""""""""""""""""
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

""""""""""""""""
" Close buffer "
""""""""""""""""
  Plug 'moll/vim-bbye'

""""""""""""""
" EasiMotion "
""""""""""""""
  Plug 'easymotion/vim-easymotion'

""""""""""""""""""""""""""
" TMux - Vim integration "
""""""""""""""""""""""""""
  Plug 'christoomey/vim-tmux-navigator'

"""""""""""""""""""
" Git integration "
"""""""""""""""""""
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Configuration from git log
  let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

  " Git Coments messages
  Plug 'rhysd/git-messenger.vim'

  " Normal color in popup window with 'CursorLine'
  hi link gitmessengerPopupNormal CursorLine
  " Header such as 'Commit:', 'Author:' with 'Statement' highlight group
  hi link gitmessengerHeader Statement
  " Commit hash at 'Commit:' header with 'Special' highlight group
  hi link gitmessengerHash Special
  " History number at 'History:' header with 'Title' highlight group
  hi link gitmessengerHistory Title

  function! s:setup_git_messenger_popup() abort
      " For example, set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
  endfunction

  autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

"""""""""""""
" Autopairs "
"""""""""""""
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  let g:closetag_filenames = '*.php,*.blade.php,*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'

""""""""""""""""""""""""
" Configurion NerdTree "
""""""""""""""""""""""""
  Plug 'scrooloose/nerdtree'
   
  let NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp', '^node_modules$' , '^.git$' ]
  let NERDTreeShowHidden = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 0
  let g:NERDTreeDirArrowExpandable = ' '
  let g:NERDTreeDirArrowCollapsible = ' '

"""""""""""""""
" Vim-Airline "
"""""""""""""""
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  set guifont=DroidSansMonoforPowerline
  
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_powerline_fonts = 1
  let g:airline_symbols = {}
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = '⎇' 
  let g:airline_symbols.readonly = ''

call plug#end()
