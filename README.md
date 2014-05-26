en tu $HOME

$ git clone https://github.com/lascar/dotvim.git

obtienes un archivo dotvim

$ rm -Rf ~/.vim ~/.vimrc

$ ln -s ~/dotvim ~/.vim

$ ln -s ~/dotvim/vimrc ~/.vimrc


$ cd ~/dotvim

$ git submodule init

$ git submodule update


para los tags
$ sudo aptitude install exuberant-ctags

$ cd ~/dotvim/doc

abrir el vim
y ejectuar
:helptags .
(no olvidar el punto final)


to update each module

$ git submodule foreach git pull origin master


install a new module
$ git submodule add https://github.com/tpope/vim-haml.git bundle/vim-haml

$ git commit . -m "add vim-haml to the submodules"

$ git push -u origin master
