#!/bin/sh
./configure --with-features=huge --enable-pythoninterp --enable-perlinterp --enable-rubyinterp --enable-luainterp --enable-multibyte --enable-sniff --enable-fontset --with-x --enable-gui=auto

#apt-get install python-dev
#apt-get install libx11-dev and libxtst-dev.
#--with-features=huge：支持最大特性
#--enable-pythoninterp：啟用Vim對python的支持
#--enable-perlinterp：啟用Vim對perl的支持
#--enable-rubyinterp：啟用Vim對ruby的支持
#--enable-luainterp：啟用Vim對lua的支持
#--enable-multibyte：多字節支持 可以在Vim中輸入中文
#--enable-sniff：Vim狀態提示 提示Vim當前處於INSERT、NORMAL、VISUAL哪種模式
#--enable-cscope：Vim對cscope支持
#--enable-gui=auto: clipboard, must apt-get install vim-gnome
