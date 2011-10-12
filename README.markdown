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
* `history` displays all previous commands.  Follow with `!999`, where 999 is the index of a history item to execute again.  Or, try `!ma`, which would execute the closest command which begins with 'ma'
* `cd -` go to previous directory
* `pushd`, `popd` cd to directory and push it onto a stack; use `popd` to revist the stack of directories

## Git
* git pull and overwrite
  * `git reset --hard HEAD; git pull`
* delete but leave on file system
  * `git rm --cached test.txt`  
* delete a remote branch
  * `git push origin :branch_name` 
* resolve conflicts all me or all them
  * `git checkout --ours index.html`
  * `git checkout --theirs index.html` 
* checkout a remote branch 
  * `git checkout -b new_branch origin/new_branch`
* pull and merge all changes with the remote copy ([SO](http://stackoverflow.com/questions/3438311/how-can-i-git-pull-rebase-but-taking-all-remote-changes))
  * `git pull -s recursive -X theirs`
* view history and then rollback to an older commit
  * `git log`
  * `git reset --hard SHA1_HASH`
* Add remote
  * `git remote add origin git@github.com:patrickmoberg/pyagg.git` 

## Files
* download from remote server
  * `scp play@173.246.100.79:/home/play/backup/current/mysql-dump.gz mysql-dump.gz`
* bulk rename examples ([sed tutorial](http://www.grymoire.com/Unix/Sed.html#uh-4))
  * `for f in fgh*; do mv $f $(echo $f | sed 's/fgh/jkl/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/2/1/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/hair/girlhair/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/male/female/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/female_\(.*\)_/&_female_/g'); done`

## MySQL
* run a script against a DB
  * `mysql -u root -pPASSWORD -h localhost bnter_latest < ~/Desktop/bnter_staging.sql`
* shut it down
  * `mysqladmin -u root -pPASSWORD shutdown`
* dump a table to file
  * `mysqldump -c -u root -pPASSWORD database table > ~/Desktop/dump.sql`
* dump database ignoring some tables
  * `mysqldump -c -u root -pPASS --database bnter_latest --ignore-table=bnter_latest.filedata --ignore-table=bnter_latest.files > ~/Desktop/bnter.sql`
* put logs to table
  * ```SET GLOBAL general_log = 'ON'; SET GLOBAL log_output = 'TABLE'; SELECT * FROM mysql.general_log; ```

## OSX
* flush DNS cache
  * `dscacheutil -flushcache`

## Coffee
* Compile a directory tree of .coffee files into a parallel tree of .js, in lib:
  * `coffee -o lib/ -c src/`
* Watch a file for changes, and recompile it every time the file is saved:
  * `coffee --watch --compile experimental.coffee`
* Combine the previous 2
  * `coffee --watch -o coffee_js/ -c coffee/`
* Concatenate a list of files into a single script:
  * `coffee --join project.js --compile src/*.coffee`

## Used to set up this environment
* in ~/.bashrc `. ~/bin/dotfiles/bashrc`
* in ~/.bash_profile
  * `if [ -f ~/.bashrc ]; then . ~/.bashrc fi`
* `ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config`
* download vcprompt
  * `curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt`
  * `chmod 755 ~/bin/vcprompt`

## File downloads
* download from remote server
  * `scp play@173.246.100.79:/home/play/backup/current/mysql-dump.gz mysql-dump.gz`

## Rails
* bin/spork
* rails console --sandbox
* bin/rake db:migrate
* bin/rake db:test:prepare
* rails generate scaffold User name:string email:string
* bin/annotate --position before
* rails generate migration addUsernameAndLast_nameToser username:string last_name:string
* bundle update
* bin/rake jasmine JASMINE_PORT=9000