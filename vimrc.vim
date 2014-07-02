""" .vimrc file
""" author: Pablo Bender <pablo@bender.eti.br>
"""

""" pathogen, first of all {{{
call pathogen#infect()
:Helptags
"""}}}

""" powerline {{{
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set rtp+=~/opt/powerline/powerline/bindings/vim
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
"""

""" options {{{

"" gui {{{
set guioptions-=T

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
"else
  "" This is console Vim.
  "if exists("+lines")
    "set lines=50
  "endif
  "if exists("+columns")
    "set columns=100
  "endif
endif
"set guioptions+=m
""}}}

"" indent {{{
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set shiftround
set autoindent
set smarttab
""}}}

"" complete for commands {{{
set wildmode=longest,list,full
set wildmenu
""}}}

"" completion {{{
set completeopt=longest,menu,preview
set complete=.,w,b,u,t,i
""}}}

"" highlight {{{
set hlsearch
""}}}

"" numbers, lines, ... {{{
set nonumber
""}}}

"" filetype {{{
" required for some plugins. eg: snipMate and matchit
filetype plugin indent on
""}}}

"" filetype for some file names {{{
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.coffee.* set filetype=coffee
"" }}}

"" map for navigation in insert mode {{{
"iunmap <c-h>
"inoremap <c-h> <left>
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-l> <right>
""}}}

"""}}}

"" map ct-bs and ct-del to delete words
"""{{{
:imap <C-BS> <C-W>
"imap <C-Del> _<Esc>mzew<BS>i<Del><Esc>v`z"_c"
"""}}}

""" fullscreen function {{{
let g:fullscreen = 0
function! ToggleFullscreen()
  if g:fullscreen == 1
    let g:fullscreen = 0
    let mod = "remove"
  else
    let g:fullscreen = 1
    let mod = "add"
  endif
  call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
endfunction

":call ToggleFullscreen()

map <silent> <F11> :call ToggleFullscreen()<CR>
""" }}}

""" molokai {{{
let g:molokai_original = 0
colors molokai
"colors argokai
"""}}}

""" taglist {{{
"let Tlist_Show_Menu = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Show_One_File = 1
"""}}}

""" minibufexpl {{{
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
""" }}}

""" snipMate {{{
"set runtimepath+=~/share/vim/snipMate/after
"""}}}

""" autocomplpop {{{
"" bug no fedora, o autocomplpop fecha ao teclar ponto
let g:acp_mappingDriven = 0
let g:acp_ignorecaseOption = 1
let g:acp_completeOption = ".,w,b,u,t,i"
let g:acp_completeoptPreview = 1
let g:acp_behaviorRubyOmniMethodLength = -1
let g:acp_behaviorRubyOmniSymbolLength = -1
"""}}}

""" srcexpl {{{
" // The switch of the Source Explorer 
"nmap <F8> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
" let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
      \ "__Tag_List__", 
      \ "_NERD_tree_", 
      \ "NERD_tree_1",
      \ "Source_Explorer",
      \ "-MiniBufExplorer-"
      \] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 
"""}}}

""" trinity {{{
" trinity integrates three plugins: NERDTree, TagList and SrcExplorer 
" Open and close all the three plugins on the same time 
"nmap <F8>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
"nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
"nmap <F10>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
"nmap <F11>  :TrinityToggleNERDTree<CR>
"""}}}

""" syntastic {{{ 
let g:syntastic_php_checkers=['php', 'phpmd']
"""}}}

""" command-t {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
""" }}}
