# README

## instalation

en tu $HOME

<pre>
   git clone https://github.com/lascar/dotvim.git
</pre>

obtienes un archivo dotvim

<pre>
   rm -Rf ~/.vim ~/.vimrc
   ln -s ~/dotvim ~/.vim
   ln -s ~/dotvim/vimrc ~/.vimrc
   cd ~/dotvim
</pre>

## install and update the submodules (fugitive, rails...)

<pre>
   git submodule init
</pre>

to update each module

<pre>
   git submodule foreach git pull origin master
</pre>


## install a new submodule

<pre>
   git submodule add https://github.com/tpope/vim-haml.git bundle/vim-haml
</pre>

<pre>
   git commit . -m "add vim-haml to the submodules"
</pre>

<pre>
   git push -u origin master
</pre>

remove a submodule (http://davidwalsh.name/git-remove-submodule)

Delete the relevant section from the .gitmodules file. 

<pre>
   git add .gitmodules
</pre>

Delete the relevant section from .git/config

<pre>
   git rm --cached bundle/submodule
</pre>

(no trailing slash)

<pre>
   rm -rf .git/modules/bundle/<submodule>
</pre>

<pre>
   rm -rf bundle/<submodule>
</pre>

# for use of tags

<pre>
  sudo aptitude install exuberant-ctags
</pre>

[using ctags for GNU-linux and MacOS](http://scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim/)

# TIPS FOR USING VIM IN UNIX

[tips for vim/unix](TIPS_VIM_UNIX.md)

