# TIPS VIM/UNIX

## open in buffers all the files that contain a string and exclude some files

<pre>
  vim $(rgrep 'remote' . |egrep -v '\./.' |cut -d ':' -f1|sort -u)
</pre>

(here we exclude all files that begins with a dot like .git or .svn)

## once in the vim, replace all occurences of 'remote' with 'toto'

<pre>
  :bufdo %s/remote/toto/gc
</pre>

(here we use 'gc' as terminator as we want to confirm each replace)

## some facilities

### use the function Str('somethings') in insert mode to insert

<pre>
  console.log('somethings : ' + JSON.stringify(somethings));
</pre>

in insert mode => 

<pre>
  <c-R>=Str('somethings')<enter>
</pre>

### in a git repository, in order to use fugitive  

<pre>
   git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
</pre>

<pre>
   git config --global merge.tool fugitive
</pre>

# the shortcut in vimrc

* \<F2> split horizontal window
* \<F3> toogle active window
* \<F4> unsplit windows
* \<F5> list of buffer and if a buffer in given toogle to this buffer
* \<F7> list of files in directory (nerdtree)
* \<F8> list of tags (exuberant_tags)
* \<F9> create or refresh the tags list (in .git)
