default: install

install:
	@echo "Creating symlinks in $(HOME)"
	@find . -iname '*.symlink' | sed -e "s!^\./\(.*\)!$(HOME)/.dotfiles/\1!;p;s!.*/\(.*\)\.symlink!$(HOME)/\1!" | xargs -n2 ln -s -i
