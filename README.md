# vimIDE-AHIR
NeoVim configurations for AHIR development

This project configures neovim (nvim) to work better with AHIR development. 

## Installing dependencies for AHIRv2
- To start with AHIR development we need to install ghdl with llvm or gcc backend. This is done by running the shell script [install_ghdl_gcc_backend.sh](install_ghdl_gcc_backend.sh). The file was taken in [VHDL Tutorial by ymahajan456](https://github.com/ymahajan456/Tutorials/tree/master/VHDL_Tutorial/Installation). This project is tested in lubuntu 14 on a VM 
  - Os : lubuntu 14 (VM)
  - RAM : 20148 MB
  - Cores : 1
 
 - Latest version of AHIR can be downloaded from [madhavPdesai/ahir](https://github.com/madhavPdesai/ahir/tree/master/v2). 
 
 ``` git clone https://github.com/madhavPdesai/ahir.git ```
 ``` cd ahir/release ```
 ``` source ahir_bashrc```
 
 You can start coding in ahir right away . For make files and other docs , refer to [docs](https://github.com/madhavPdesai/ahir/tree/master/release/docs). 
 
 ## Installing Neovim 
 - Neovim is not packaged with *ubuntu14*. You will have to build neovim from sources . If you dont have any problem with installing python versions, you can use the [script](install-nvim.sh) provided in this project. It just follows the steps mentioned in [Neovim wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source) with some additional fixes for running [nvim-completion-manager](https://github.com/roxma/nvim-completion-manager) .
 
 ```chmod 755 install-nvim.sh```
 ```sh install-nvim.sh```
 
 Default install location is ~/.local/share/nvim . This project assumes that nvim is installed in default  path 
 
 ## Configuring Neovim 
 
 - Neovim configuration file is stored at $HOME/.config/nvim/init.vim . You might have to create the directory. ```mkdir -p $HOME/.config/nvim``` . After that copy [init.vim](init.vim) to the folder(or create a hardlink). 
