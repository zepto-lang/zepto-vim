# zepto-vim

This repository contains a Vim plugin for zepto that is only
capable of syntax highlighting at the moment. It is largely
based on [the racket vim plugin for pathogen](https://github.com/wlangstroth/vim-racket),
with a few extensions, e.g. for list comprehensions.

## Installation

### Pathogen

Probably the most handy way to install the zepto vim plugin is by using
[pathogen](https://github.com/tpope/vim-pathogen). Installation using
pathogen goes like this:

````bash
cd ~/.vim/bundle
git clone git://github.com/zeptolang/zepto-vim.git
```

### Manual

#### Unix

The "installation" process should look something like this on Unix-based
OSs:

```bash
git clone https://github.com/zepto-lang/zepto-vim.git
cd zepto-vim
cp -r ftdetect ~/.vim
cp -r syntax ~/.vim
```

#### Windows

I cannot test Windows installation at the moment, because I do not own a
Windows box, but doing it should look pretty similar, something along
the lines of:

```powershell
git clone https://github.com/zepto-lang/zepto-vim.git
dir zepto-vim
xcopy /e ftdetect $HOME/vimfiles/ftdetect
xcopy /e syntax $HOME/vimfiles/syntax
```

I do not know whether that could corrupt your current configuration, though,
so use with caution!
