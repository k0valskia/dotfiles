if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'wojciechkepka/vim-github-dark'
	Plug 'vim-airline/vim-airline-themes'
	" Discord Rich Presence
	Plug 'andweeb/presence.nvim'
	" Tree
	Plug 'scrooloose/nerdtree'
	" Icons
	Plug 'ryanoasis/vim-devicons'
	" auto completion
	Plug 'nvim-lua/completion-nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" Auto install missing plugins
autocmd VimEnter *
set number
