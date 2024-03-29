This is my personal vim set up. I'm using GitHub for version control & portability.  

# Vim Plug Ins:
| Description                               | Name (Link to GitHub)                                                        |
| ----------------------------------------- | ---------------------------------------------------------------------------- |
| Plug in manager                           | [Vim Plug](https://github.com/junegunn/vim-plug)                             |
| File browsing                             | [NERDTree](https://github.com/scrooloose/nerdtree)                           |
| Git gutter                                | [Vim-Signify](https://github.com/mhinz/vim-signify)                          |
| Whitespace stripping                      | [Vim-Better-Whitespace](https://github.com/ntpeters/vim-better-whitespace)   |
| Better indents for parentheses/brackets   | [Indent-Python](https://github.com/tsanch3z/indent-python.vim)               |
| Code linting                              | [Ale](https://github.com/dense-analysis/ale)                                 |
| Previewing Markdown in browser            | [previm](https://github.com/previm/previm/blob/master/README-en.mkd)         |
| Easy commenting/uncommenting              | [vim-commentary](https://github.com/tpope/vim-commentary)                    |
| Aligning text, tables, values, etc.       | [tabular](https://github.com/godlygeek/tabular)                              |
| Better status line at bottom of screen    | [lightline.vim](https://github.com/itchyny/lightline.vim)                    |
| Function that returns name of git branch  | [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)                    |
| Color Scheme                              | [onehalf](https://github.com/sonph/onehalf)                                  |
| Python Syntax Highlighting                | [python-syntax](https://github.com/vim-python/python-syntax)                 |
| Status bar that includes flake8 errors    | [lightline-ale](https://github.com/maximbaz/lightline-ale)                   |


## To Port (first time in new env):  
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
    
8. Cleanup plug-ins (delete unused plug-ins)  
    `vim`  
    `:PlugClean`  

## Updating (no need to port again):  
1. Once .vim has been ported (following above), no need to re-create symbolic link.  
   Pulling from repo will include updates.  

2. Simply pull from repo (within cloned repo in env to update)  
   `git pull origin master`  

3. If new vim plug ins were added, must install them  
   `vim`  
   `:PlugInstall`  
   
4. If old vim plug ins were removed, must uninstall them  
   `vim`  
   `:PlugClean`  
   
5. If new vim plug ins require a python package, must install it  
   (For example, syntastic requires flake8 python package)  
   `pip insall flake8` OR `pip install flake8 --user`  


## Plugin Reminders
### **Previm**
- Use `:PrevimOpen` to open `.md` file in browser for preview
- Use `:help g:previm_open_cmd` for man page
    ```
    # Windows
    let g:previm_open_cmd = 'start chrome'

    # Mac
    let g:previm_open_cmd = 'open -a Google\ Chrome'
    ```
