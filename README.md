# .vimrc

I'm a VIM guy. Here's [my .vimrc file](https://github.com/ajpierce/vimrc/blob/master/.vimrc).
It's commented!

## Plugin Management

I use [Vundle](https://github.com/gmarik/Vundle.vim) to manage my plugins.

Install Vundle like so:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Once Vundle is in place, and assuming you've specified your plugins in your
`.vimrc` file correctly, simply:

    vim +PluginInstall +qall

Congratulations! Your (my) VIM environment is ready to go.

# .gitconfig

    git newb bugfixes   # Creates a new branch "bugfixes" with the latest code

The `git newb` command (short for "new branch"). This command checks out the
latest version of the upstream (non-forked) repo's active-development branch,
and creates a new branch based off of it. Running this command before every
feature or bugfix minimizes the chance of merge conflicts by ensuring that I
have the most recent code.

    git diffc
    git diffs

Shorthand for `git diff --cached` and `git diff --stat`, respectively. Cached
shows you the changes that you've added (but not committed), and stat shows you
just the files that you've changed.

# .bash_profile
I'm particular about my terminal prompt. This file specifies my prompt, but also
contains a couple winning functions:

    rfar old_string new_string

`rfar` is short for "Recursive Find and Replace." In this implementation of the
function, it searches all `.js`, `.json`, and `.html` files (but ignores those
in `node_modules` and `bower_components`), and replaces all instances of
`old_string` with `new_string`.

    vag Apache License

I use [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) in
place of `grep` for finding files. It's beautifully fast, and has some other
cool features.

One such feature is `ag -l "my query"`: "List all files matching 'my query'".
The `-l` argument shows just the filename, rather than the matching instance in
the file.

`vag` simply takes the output of this command and pipes it to `vim` (my editor
of choice), meaning that all files matching my query are now open in the buffer.
In the case of the example above (`vag Apache License`), every file containing
the text "Apache License" opens in my vim buffer, allowing me to (for example)
create a quick macro to convert the Apache License to MIT and move quickly
through all buffers (files) applying it.
