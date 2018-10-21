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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" fatih/vim-go plugin
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>d  :GoDecls<CR>
autocmd FileType go nmap <Leader>e  :GoInstall<CR>
autocmd FileType go nmap <Leader>m  :GoDoc<CR>

let g:go_auto_type_info = 1
let g:go_version_warning = 0

" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

" airline/airline
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

