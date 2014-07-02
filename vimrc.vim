""" .vimrc file
""" author: Pablo Bender <pablo@bender.eti.br>
"""

""" pathogen, first of all {{{
call pathogen#infect()
:Helptags
"""}}}

set nocompatible

""" vim-airline (powerline replacement) {{{
let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"

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

""" neocomplcache {{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""" }}}

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

""" ag (ack replacement) for text searching (like grep) {{{
let g:ackprg="ag --nogroup --nocolor --column"
""" }}}

"""" closetag {{{
" original autocmd from documentation: autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
""" }}}

""" nerdtree-tabs {{{
let g:nerdtree_tabs_open_on_gui_startup = 0
""" }}}

""" ultisnips {{{
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
""" }}}
