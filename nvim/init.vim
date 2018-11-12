" common setup
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set softtabstop=2
set nobackup
set nowritebackup
set noswapfile
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux
set autowrite
set rtp+=~/.fzf " fzf
let mapleader=","
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader><up> :wincmd k<CR>
nnoremap <silent> <Leader><down> :wincmd j<CR>
nnoremap <silent> <Leader><left> :wincmd h<CR>
nnoremap <silent> <Leader><right> :wincmd l<CR>

call plug#begin()
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'rodjek/vim-puppet'
call plug#end()

" fatih/vim-go plugin
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
"autocmd FileType go nmap <Leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>d  :GoDecls<CR>
autocmd FileType go nmap <Leader>e  :GoInstall<CR>
autocmd FileType go nmap <Leader>m  :GoDoc<CR>
map <Leader>n :cnext<CR>
map <Leader>p :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_version_warning = 0
let g:go_auto_sameids = 1

" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

" airline/airline
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

" ultisnippets plugin
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" gocode plugin
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
let g:go_gocode_propose_source=0
