# bin
[this guy](https://rhodesmill.org/brandon/2009/commands-with-comma/)

# install
````bash
# create bin dir at home, add it to $PATH and create symlinks to cmd/*
$ mkdir -p ~/bin
$ echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
$ ln -siv -t ~/bin $PWD/cmd/*
````

Even works with tab-completion ootb `,<TAB>`!

# license
MIT
