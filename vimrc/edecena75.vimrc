" GENERALIDADES.
set nocompatible	" Todos los comandos en modo Vim, no compatible con Vi.
set shell=/bin/bash	" Interfaz bash.
set ttyfast			" Terminal rápido.
set noerrorbells	" Silenciar los errores.
set visualbell		" Silencia los errores y lo reemplaza por un parpadeo.
set helplang=es		" Idioma de la ayuda y los mensajes.
set history=1000	" Tamaño del historial de comandos.
set autochdir		" Directorio activo es el del archivo editado.
set more			" Pausa el listado por pantalla cuando está llena.
set clipboard=unnamed	" Todo lo que copiemos en el registro también se copiará en el portapapeles.
set hidden			" Allow buffer switching without saving.
set linespace=0"	" No extra spaces between rows.
set backspace=2		" Setea la tecla backspace.
set winminheight=0 " Windows can be 0 line high.
set wildmenu		" Show list instead of just completing.
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too.
set list
set listchars=tab:›\ ,trail:·,extends:#,nbsp:· " Highlight problematic whitespace"
set mps+=<:>	    " Añade el < para el emparejado con %.
set mps+=¡:!	    " Añade el < para el emparejado con %.
set mps+=¿:?	    " Añade el < para el emparejado con %.
set mps+=":"	    " Añade el < para el emparejado con %.

" CHEQUEO DE LA ORTOGRAFÍA EN ESPAÑOL
" https://elosasis.0wordpress.0com/2014/08/09/linux-correcto-de-texto-en-espanol-para-vim/
set nospell
set spelllang=es

" VISUALIZACIÓN Y APARIENCIA.
set t_Co=256		" Formato a 256 colores en la terminal.
colorscheme torte	" Esquema de Color: evening, industry, torte
set background=dark	" Color de fondo.
set ruler			" Activa la regla inferior derecha.
set showmode		" Activa la indicación de modos.
set showcmd			" Activa la indicación de comandos.
syntax enable		" Activa el coloreado de sintaxis.
"
" Activa los números de línea y su formato.
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLineNr ctermfg=yellow

" Activa el resaltado de la línea activa y su formato.
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=white guibg=black

" Color del seleccionado de línea.
hi Visual ctermfg=lightgrey ctermbg=black

" Activa el coloreado en la columna 80.
set colorcolumn=80	" Activa una barra coloreada en la columna 80. 
hi ColorColumn cterm=NONE ctermbg=darkmagenta ctermfg=white guibg=black " Configuración del resaltado.

" Color de los comentarios en código.
highlight Comment ctermfg=DarkGray

set showmatch		" Coincidencia de paréntesis, corchetes y llaves.
set laststatus=0	" Muestra una línea de estado para cada ventana, incluso en modo de ventana única.

" SANGRADO, ANCHO DE LÍNEA y TABULADORES.
set wrap			" Las líneas anchas no se ven enteras.
set linebreak		" Corta las líneas.
set tabstop=4		" Espacios para el tabulado.
set shiftwidth=4	" Tamaño para espaciado con los comandos de tabulación >> y <<
set softtabstop=4
"set expandtab		" Sustituye las tabulaciones por espacios.
set textwidth=80	" Ancho de la línea.
set columns=80		" Ancho de la pantalla.
set autoindent		" Autoindentación de la línea precedente.
set smartindent		" Autoindentación de la línea precedente.
filetype indent on	" Autoindentación.
set cindent			" Identación para lenguaje C.
set commentstring=\ #\ %s " Comentarios para Python.

" BÚSQUEDAS.
set hlsearch		" Ilumina todas las apariciones de la cadena buscada.
set incsearch		" Búsqueda incremental.
hi Search cterm=none ctermfg=black ctermbg=yellow " Color de lo encontrado.
set ignorecase		" Ignorar mayúsculas y minúsculas en las búsquedas.
set smartcase		" Ignorar mayúsculas y minúsculas en las búsquedas.
set wrapscan		" Búsqueda circular.

" CONJUNTO DE CARACTERES y OPCIONES DE LECTURA - ESCRITURA.
set fileencoding=utf-8
set encoding=utf-8
set autowrite		" Automáticamente guarda un archivo cuando se sale de un buffer.
set autoread		" Automáticamente reload un archivo cuando ha sido modificado por otro por vía externa a Vim.
set mouse=r			" Habilita el ratón en xterm o GUI, apretando CTRL mientras se selecciona.

" PLEGADO.
"set foldmethod=indent
"set foldopen=all	" zR abre TODOS los plegados. zM los cierra todos.
"set foldclose=all
"set foldenable

" TIPO DE ARCHIVO Y RESALTADO DE SINTAXIS.
filetype on
filetype plugin on	" Activa el uso de plugin según el tipo de archivo.
set filetype=python
set syntax=python
set syntax=ON		" Activa el resaltado de sintaxis.
"set omnifunc=syntaxcomplete#Complete " Se activa con C-X C-O.

" AUTOCERRADO DE CARACTERES.
" http://vim.wikia.com/wiki/Automatically_append_closing_characters
" Llaves.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" Paréntesis.
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.0'), col('.0')-1, 1) == ")" ? "\<Right>" : ")"
" Corchetes.
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.0'), col('.0')-1, 1) == "]" ? "\<Right>" : "]"
" Comillas.
inoremap <expr> ' strpart(getline('.0'), col('.0')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.0'), col('.0')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" MAPEO Y ABREVIATURAS.
map <F5> :w<CR>:!clear;./%;echo;echo "Presione enter para continuar...";read<CR> " Guarda y ejecuta el archivo actual.
imap <F5> <Esc>:w<CR>:!clear;./%;echo;echo "Presione enter para continuar...";read<CR>
map <F9> :tabn<CR> " Pasa a la siguiente Tab en modo comando.
imap <F9> <Esc> :tabn<CR> " Pasa a la siguiente Tab en modo inserción.
map <C-G> :w<CR> " Guardar en modo comando.
map <C-l> :bn<CR> " Pasa al siguiente buffer en modo comando.
imap <C-G> <Esc>:w<CR><i> " Guardar en modo inserción.
map <C-E> :wq<CR> " Guardar y salir en modo comando.
imap <C-E> <Esc>:wq<CR> " Guardar y salir en modo inserción.

" INSERT AND REMOVE COMMENTS IN VISUAL MODE PARA PYTHON
vmap ,l :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,k :s/^#//g<CR>:let @/ = ""<CR>

" MAPS PARA PYTHON.
iab #! #!/usr/bin/env python<CR># encoding=utf8<CR>"""<CR><TAB>Título para este módulo.<CR>-----------------------------------<CR><CR><CR><BS>"""<CR>__author__     = "Edgard Decena"<CR>__build__      = "edecena75"<CR>__copyright__  = "Copyleft 2017 - Edgard Decena."<CR>__license__    = "GPL"<CR>__title__      = ""<CR>__version__    = "1.0.0"<CR>__maintainer__ = Edgard Decena"<CR>__email__      = "edecena@gmail.com"<CR>__status__     = "Production"<CR>__credits__    = "Edgard Decena"<CR>

" MAPS PARA PHP.
iab /* /**<CR>* Comentario<CR>*/<Up>

" PATHOGEN PLUGIN MANAGER
execute pathogen#infect()

" KHUNO PLUGIN.
let g:khuno_ignore="E221,E402"
