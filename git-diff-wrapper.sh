# diff is called by git with 7 parameters:
# path old-file old-hex old-mode new-file new-hex new-mode

# set up with 
# chmod +x /Users/goggin/bin/dotfiles/git-diff-wrapper.sh 
# git config --global diff.external /Users/goggin/bin/dotfiles/git-diff-wrapper.sh 

/usr/bin/opendiff "$2" "$5" | cat