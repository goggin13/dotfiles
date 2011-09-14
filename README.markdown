# Unix Commands
Some helpful commands that I want to write down because I'm always looking them up anyways

## Terminal Navigation
* `^a` beginning of line
* `^e` end of line
* `^k` delete everything to the right
* `^w` delete previous word
* `^r` interactive search; start typing to lookup previous commands. `enter` to execute, `^g` to abandon
* `ESC-b` go back one word
* `ESC-f` go forward one word
* `!!` previous command
* `!$` last argument from previous command. `!:0`, `!:1`, to index arguments
* `^from^to` replace first occurrence of from with to
* `history` displays all previous commands.  Follow with `!999`, where 999 is the index of a history item to execute again
* `cd -` go to previous directory
* `pushd`, `popd` cd to directory and push it onto a stack; use `popd` to revist the stack of directories

## Used to set up this environment
* in ~/.bashrc `. ~/bin/dotfiles/bashrc`
* in ~/.bash_profile
`if [ -f ~/.bashrc ];
then
	. ~/.bashrc
fi`
* `ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config`
* download vcprompt
  * `curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt`
  * `chmod 755 ~/bin/vcprompt`

## Git
* git pull and overwrite
  * `git reset --hard HEAD`
* delete but leave on file system
  * `git rm --cached test.txt`   

## File downloads
* download from remote server
  * `scp play@173.246.100.79:/home/play/backup/current/mysql-dump.gz mysql-dump.gz`

## MySQL
* run a script against a DB
  * `mysql -u root -pPASSWORD -h localhost bnter_latest < ~/Desktop/bnter_staging.sql`
* shut it down
  * `mysqladmin -u root -pPASSWORD shutdown`
* dump a table to file
  * `mysqldump -c -u root -pPASSWORD database table > ~/Desktop/dump.sql`