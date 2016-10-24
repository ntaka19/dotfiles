set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定
set shiftwidth=2 "自動インデントでずれる幅
set smartindent "オートインデント
set clipboard=unnamedplus,autoselect

noremap <S-h> ^
noremap <S-l> $

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る


"nnoremap <silent><C-e> :NERDTreeToggle<CR>

let $PATH = $PATH . ':' . expand('~/.cabal/bin')


if has('vim_starting')
		   " 初回起動時のみruntimepathにneobundleのパスを指定する
		      set runtimepath+=~/.vim/bundle/neobundle.vim/
		      endif
		   
		   "    " NeoBundleを初期化
		       call neobundle#begin(expand('~/.vim/bundle/'))
		   "
		   "    " インストールするプラグインをここに記述
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/vimfiler'
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'pangloss/vim-javascript'
	NeoBundle 'Townk/vim-autoclose'
	NeoBundle 'derekwyatt/vim-scala'
	NeoBundle 'kana/vim-filetype-haskell'
	
	NeoBundle 'thinca/vim-quickrun' "その場所で実行可能
	NeoBundle 'derekwyatt/vim-scala' "scalaのプラグイン
	" https://github.com/Shougo/neocomplete.vim
	NeoBundle 'Shougo/neocomplete.vim'
           
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'thinca/vim-ref'
	NeoBundle 'kana/vim-filetype-haskell'
	NeoBundle 'eagletmt/ghcmod-vim'
	NeoBundle 'ujihisa/neco-ghc'
	NeoBundle 'osyo-manga/vim-watchdogs'
	NeoBundle 'ujihisa/ref-hoogle'
	NeoBundle 'ujihisa/unite-haskellimport'
	NeoBundle 'Shougo/vimproc'
	NeoBundle 'vim-latex/vim-latex'
	NeoBundle 'sophacles/vim-processing'
	NeoBundle 'kchmck/vim-coffee-script'	
	NeoBundle 'claco/jasmine.vim' "js BDDツール
	NeoBundle 'nathanaelkane/vim-indent-guides' "indentの深さに色をつける

	au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
	autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
 
 
 	" Use neocomplete.
		let g:neocomplete#enable_at_startup = 1
	 " Use smartcase.
	 let g:neocomplete#enable_smart_case = 1
	 " Use underbar completion.
		 let g:neocomplete#enable_underbar_completion = 1
	 " ユーザ定義の辞書を指定
		 let g:neocomplete#sources#dictionary#dictionaries = {
			 \ 'default' : '',
				 \ 'scala' : $HOME . '/.vim/dict/scala.dict',
					 \ }
	 " Plugin key-mappings.
					 inoremap <expr><C-g>     neocomplete#undo_completion()
					 inoremap <expr><C-d>     neocomplete#complete_common_string()
	 " Recommended key-mappings.
	 " <CR>: close popup and save indent.
	 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	 function! s:my_cr_function()
			 return neocomplete#close_popup() . "\<CR>"
			 endfunction
	 " <C-h>, <BS>: close popup and delete backword char.
		inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><C-y>  neocomplete#close_popup()
		inoremap <expr><C-e>  neocomplete#cancel_popup()
	 
	 
	 " 水平に分割する
	 let g:quickrun_config={'*': {'split': ''}}
	 "
	 call neobundle#end()
		
	 " ファイルタイプ別のプラグイン/インデントを有効にする
	 filetype plugin indent on


""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
""let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode
"-file-line-error-style $*'
""let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode
"-file-line-error-style $*'
""let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode
"-file-line-error-style $*'
"let g:Tex_BibtexFlavor = 'upbibtex'
"let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'xdg-open'
""let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
""let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
""let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
""let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'



NeoBundleLazy 'sophacles/vim-processing'
augroup Processing
	    autocmd!
			    autocmd BufNewFile *.pde NeoBundleSource vim-processing
					    autocmd BufRead    *.pde NeoBundleSource vim-processing
						augroup END

		let g:quickrun_config.processing = {
			\     'command': 'processing-java',
			\     'exec': '%c --sketch=%s:p:h/ --output=/tmp/processing --run --force' }


NeoBundleCheck














		
