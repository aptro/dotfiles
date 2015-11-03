install: install-vim install-git install-zsh install-terminal-settings

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-git:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore ~/.gitignore	

install-zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc

dump-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal
	plutil -convert xml1 terminal/com.apple.Terminal.plist

install-terminal-settings:
ifeq ($(shell uname),Darwin)
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
	@echo "Old terminal settings were saved in terminal folder"
endif
