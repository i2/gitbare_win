#set clipboard=unnamed

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Simplenote
" Plug 'https://github.com/simplenote-vim/simplenote.vim.git'
" source $XDG_CACHE_HOME/simplenote/cred.txt
" let g:SimplenoteSingleWindow = "true"

" Plug 'junegunn/goyo.vim'
" Plug 'reedes/vim-pencil'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-obsession'

" Initialize plugin system
call plug#end()

set clipboard+=unnamedplus

set mouse=a

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3 
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Lexplore
"augroup END

" autocmd filetype netrw nmap <c-a> <cr>:wincmd W<cr>

" Toggle Vexplore with Ctrl-/
function! ToggleLExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Lexplore!
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-K> :call ToggleLExplorer()<CR>

nnoremap <C-P> :GFiles<CR>
nnoremap <C-a>s :!tmux attach<CR>

" VSCode-like vim
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" Toggle between no-number, number, relativenumber-0 and relativenumber-line
"nnoremap <silent> <F3> :exec &nu==&rnu ? "set rnu!" : "set nu!" <CR>
nnoremap <silent> <F3> :exec 'set nu!' &nu ? 'rnu!' : '' <CR>

" Reza added these
nnoremap <C-a>f :Vex <CR>
set relativenumber
set number
