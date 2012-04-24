# From http://stackoverflow.com/questions/255202/how-do-i-view-git-diff-output-with-visual-diff-program

# TO SET UP
 
# curl -o ~/git-diff-wrapper.sh https://raw.github.com/goggin13/dotfiles/master/git-diff-wrapper.sh
# chmod +x ~/git-diff-wrapper.sh 
# git config --global diff.external /Users/goggin/bin/dotfiles/git-diff-wrapper.sh 

# diff is called by git with 7 parameters:
# path old-file old-hex old-mode new-file new-hex new-mode

/usr/bin/opendiff "$2" "$5" | cat