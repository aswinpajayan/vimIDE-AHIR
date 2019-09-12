# vimIDE-AHIR
NeoVim configurations for AHIR development

This project configures neovim (nvim) to work better with AHIR development. 

## Installing dependencies for AHIRv2
- To start with AHIR development we need to install ghdl with llvm or gcc backend. This is done by running the shell script [install_ghdl_gcc_backend.sh](install_ghdl_gcc_backend.sh). The file was taken in [VHDL Tutorial by ymahajan456](https://github.com/ymahajan456/Tutorials/tree/master/VHDL_Tutorial/Installation). This project is tested in lubuntu 14 on a VM 
  - OS : lubuntu 14 (VM)
  - RAM : 20148 MB
  - Cores : 1
 
 - Latest version of AHIR can be downloaded from [madhavPdesai/ahir](https://github.com/madhavPdesai/ahir/tree/master/v2). 
 
 ``` 
 git clone https://github.com/madhavPdesai/ahir.git
 cd ahir/release
 source ahir_bashrc
 ```
 
 You can start coding in ahir right away . For make files and other docs , refer to [docs](https://github.com/madhavPdesai/ahir/tree/master/release/docs). 
 
 ## Installing Neovim 
 - Neovim is not packaged with *ubuntu14*. You will have to build neovim from sources . If you dont have any problem with installing python versions, you can use the [script](install-nvim.sh) provided in this project. It just follows the steps mentioned in [Neovim wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source) with some additional fixes for running [nvim-completion-manager](https://github.com/roxma/nvim-completion-manager) . 
 - Neovim can be started with the command nvim. All vim commands and scripts works in nvim. I prefer nvim because of more number of terminal colors, better linting engine, easy integration with system clipboard. Most of the things will work with good old vim with version > 8 .

```
chmod 755 install-nvim.sh
sh install-nvim.sh
```

 Default install location is ~/.local/share/nvim . This project assumes that nvim is installed in default  path 
 
 ## Installing Neovim 
 
 - Neovim configuration file is stored at $HOME/.config/nvim/init.vim . You might have to create the directory. ```mkdir -p $HOME/.config/nvim``` . After that copy [init.vim](init.vim) to the folder(or create a hardlink). init.vim can automatically install [vimplug](https://github.com/junegunn/vim-plug). For this you need to have curl command installed. Given below is the snipptet from init.vim which does that 
 
 ```
 if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```
## Syntax Highlighting 

 - Uses vim's defualt syntax highlighter. 
 - Supports keyword highlighting, code folding (it follows basic language rules from Aa LRM
 - syntax highlighting is provided by the file [syntax/ahir.vim](syntax/ahir.vim). This file needs to kept in ```~/.local/share/nvim/sytax/ahir.vim```
 - files with .aa extension is automatically tagged as filetype=ahir by the file [ftdetect/ahir.vim] . To be kept in ```~/.local/share/nvim/ftdetect/ahir.vim```
 
## Code completion

 - Installing Plugins for Neovim. We use the below plugins to ease up the development 
   - sirver/ultisnips
	 - neomake/neomake
	 - roxma/nvim-completion-manager
 These are mentioned in the plug# section of init.vim and can be installed by the command
 
 ```:PlugInstall```
 
 -  Some ready to use code snippets are available in the file [ahir.snippets](UltiSnips/ahir.snippets) . This file should be kept in the path ```$HOME/UltiSnips/ahir.vim``` . Snippets can be edited in nvim using the command ```:UltiSnipsEdit``` .	
 
 - You can use ctags to enable code completion from tags file 
 - Autocompletion is providided by the nvim-completion-manager plugin : press Tab to expand the available options
 
 
 
