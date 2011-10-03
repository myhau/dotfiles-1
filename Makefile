default: install

install:
	echo "Creating symlinks in $(HOME)"
	@find . -iname '*.symlink' | sed -e "p;s!\./\(.*\).symlink!$(HOME)/\1!" | xargs -n2 ln -s -i
