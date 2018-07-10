This is my personal vim set up
> Version Control & Portability  
> Plug in manager --> [Vim Plug](https://github.com/junegunn/vim-plug)  
>> [NERDTree](https://github.com/scrooloose/nerdtree)  
>> [Vim-Signify](https://github.com/mhinz/vim-signify)  
>> [Vim-Better-Whitespace](https://github.com/ntpeters/vim-better-whitespace)  
>> [Indent-Python](https://github.com/tsanch3z/indent-python.vim)  

To port:  
1. If .vim dir already exists, check to see if any relevant file need to be copied.  
   If so, copy file(s) into home dir  
   `cp ~/.vim/spell ~/spell -r`  

2. Remove existing .vim dir **AFTER** relevant files have been copied  
    `rm .vim --recursive`

3. Remove .vimrc if it exists  
    `rm .vimrc`  

4. Clone repo  
    `git clone https://github.com/loganthomas/.vim.git`  

5. Create symbolic link (like shortcut) in home directory  
    `ln -s ~/.vim/vimrc ~/.vimrc`  

6. If previous relevant files were copied, move them into new (cloned) .vim dir  
    `mv ~/spell ~/.vim/spell` 

7. Install plug-ins  
    `vim`  
    `:PlugInstall`
