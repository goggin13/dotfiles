# Unix Commands
Some helpful commands that I want to write down because I'm always looking them up anyways

## Terminal Navigation
`^a` beginning of line
`^e` end of line
`^k` delete everything to the right
`^w` delete previous word
`^r` interactive search; start typing to lookup previous commands. `enter` to execute, `^g` to abandon
`ESC-b` go back one word
`ESC-f` go forward one word
`!!` previous command
`!$` last argument from previous command. `!:0`, `!:1`, to index arguments
`^from^to` replace first occurrence of from with to
`history` displays all previous commands.  Follow with `!999`, where 999 is the index of a history item to execute again

## Used to set up this environment
in ~/.bashrc
`. ~/bin/dotfiles/bashrc`
in ~/.bash_profile
`if [ -f ~/.bashrc ];
then
	. ~/.bashrc
fi`
`ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config`

## Git
`git --reset hard HEAD`