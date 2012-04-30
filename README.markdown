 # Unix Commands
Commands that I want to write down because I'm always looking them up anyways

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
  * press `esc` followed by `ctrl+e` to expand the command but not execute it [(SF)](http://serverfault.com/questions/375316/how-to-copy-a-previously-entered-command-using-the-history-utility-without-runni?newsletter=1&nlcode=13741%7c017a)  
* `cd -` go to previous directory
* `pushd`, `popd` cd to directory and push it onto a stack; use `popd` to revist the stack of directories
* `strace` to view messages from a particular process id.  Useful if `top` is displaying exepensive processes that you want to debug.  
  * `sudo strace -p PID`    
  * [presentation](http://www.scribd.com/doc/31915761/Ruby-Debugging-at-Unix) using this to debug ruby apps  


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
* Checkout a specific commit on a new branch
  * `git checkout -b aNewBranch SHA1` (SHA1 = commit id)
* Checkout a file from a different branch
  * `git checkout <branch_you_want_to_merge_from> <file_paths...>`
* Update list of branches
  * `git fetch`
* pull a specific commit from another branch
  * `git cherry-pick <commit-hash>`  
* checkout and track a remote branch 
  * `git checkout -b local-name origin/remote-name`
* Reset a file to a specific commit
  * `git checkout sha1hash file/to/restore`
* Show commits in one branch and not another ([SO](http://stackoverflow.com/questions/7548926/git-and-the-branch-x-is-not-fully-merged-error))  
  * `git log --graph --left-right --cherry-pick --oneline master...experiment`   
* show all commits in any branch (--all) that introduced or removed a string from a file  
  * `git log --all -Sdomain_safe_username app/models/user.rb`  
* undo last commit (see here)[http://stackoverflow.com/questions/927358/git-undo-last-commit]
  * `git reset --soft HEAD^`  # then perform your edits  
  * `git add -A`  # add your edits   
  * `git commit -c ORIG_HEAD` # commit them back  
* search commits  
  * `git log --grep=foobar --since=1.month`   
* retrieve a deleted file  [SO](http://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo)
  * `git rev-list -n 1 HEAD -- <file_path>` # the last commit which affected it (therefore the deleting commit)  
  * `git checkout <deleting_commit>^ -- <file_path>` # checkout the previous commit  
* rebase pushed commits (assuming no one else has pulled them [SO](http://stackoverflow.com/questions/5667884/how-to-squash-commits-in-git-after-they-have-been-pushed)  
  * `git rebase -i` and then `git push origin +master` (or `git push --force origin master`)  

## Files
* download from remote server
  * `scp play@173.246.100.79:/home/play/backup/current/mysql-dump.gz mysql-dump.gz`
* push to remote server  
  * `scp ~/Desktop/bnter_2011_10_19.sql root@172.132.66.106:~`  
* bulk rename examples ([sed tutorial](http://www.grymoire.com/Unix/Sed.html#uh-4))
  * `for f in fgh*; do mv $f $(echo $f | sed 's/fgh/jkl/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/2/1/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/hair/girlhair/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/male/female/g'); done`
  * `for f in *; do mv $f $(echo $f | sed 's/female_\(.*\)_/&_female_/g'); done`
* tail a log for a specific result, showing 5 lines before and after it
  * `tail -f log/production.log | grep -5 "likes"`
  * `grep -A 5 "likes"`  # just the 5 lines after the match  
  * `grep -B 5 "likes"`  # just the 5 lines before the match  
* sed modify in place  
  * `sed -i '' -e "s/\(line\)/#\1/g"  file.txt`  

## MySQL
* run a script against a DB
  * `mysql -u root -pPASSWORD -h localhost bnter_latest < ~/Desktop/bnter_staging.sql`
* shut it down
  * `mysqladmin -u root -pPASSWORD shutdown`
* dump a table to file
  * `mysqldump -c -u root -pPASSWORD database table > ~/Desktop/dump.sql`
* write a query result to a file
  * `mysql -e "select * from myTable" -u myuser -pxxxxxxxxx mydatabase > mydumpfile.txt`  
* dump database ignoring some tables
  * `mysqldump -c -u root -pPASS --database bnter_latest --ignore-table=bnter_latest.filedata --ignore-table=bnter_latest.files > ~/Desktop/bnter.sql`
* put logs to table (will reset on server restart)
  * ```SET GLOBAL general_log = 'ON'; SET GLOBAL log_output = 'TABLE'; SELECT * FROM mysql.general_log ORDER BY event_time DESC; ```
* change encoding
  * mysqldump -u root -p --opt --default-character-set=latin1 --skip-set-charset  DBNAME > DBNAME.sql
  * mysql -u root -p --default-character-set=utf8  DBNAME < DBNAME.sql
  * see [SO post](http://stackoverflow.com/questions/346092/utf8-mysql-problems-on-rails-encoding-issues-with-utf8-general-ci)  
* create a user and grant them privileges
  * `CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';`
  * `GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost';`  
* Get size of all databases in MB  
`SELECT table_schema "Data Base Name",`  
`       sum( data_length + index_length ) / 1024 / 1024 "Data Base Size in MB"`  
`FROM information_schema.TABLES`  
`GROUP BY table_schema;`  
* find and kill a query  
  * `show processlist`  
  * `kill <pid>`  
* drop an index
  * `DROP INDEX index_name ON tbl_name` 

## OSX
* flush DNS cache
  * `dscacheutil -flushcache`
* top CPU consumers  
  * `top -o cpu -stats command,cpu,threads -n 20`  

## Coffee
* Compile a directory tree of .coffee files into a parallel tree of .js, in lib:
  * `coffee -o lib/ -c src/`
* Watch a file for changes, and recompile it every time the file is saved:
  * `coffee --watch --compile experimental.coffee`
* Combine the previous 2
  * `coffee --watch -o coffee_js/ -c coffee/`
* Concatenate a list of files into a single script:
  * `coffee --join project.js --compile src/*.coffee`

## CURL
* post requst
  *  `curl -d "param1=value1&param2=value2" http://example.com/resource.cgi` 
* download a file  
  *  `curl https://github.com/goggin13/dotfiles/blob/master/colorssh.sh -o ~/colorssh.sh`   
* debug transfer times  
  * `curl http://banters.com/?session_id=YOUR_SESSION_ID -w 'curl times
[s]:\n\ttime_starttransfer: %{time_starttransfer}\n\ttime_redirect:
%{time_redirect}\n\ttime_pretransfer:
%{time_pretransfer}\n\ttime_connect:
%{time_connect}\n\ttime_namelookup:
%{time_namelookup}\n\ttime_appconnect:
%{time_appconnect}\n\ttime_total: %{time_total}' -i`    

## Used to set up this environment
* `mkdir ~/bin; cd ~/bin`
* `git clone git@github.com:goggin13/dotfiles.git`
* in ~/.bashrc `. ~/bin/dotfiles/bashrc`
* in ~/.bash_profile
  * `if [ -f ~/.bashrc ]; then . ~/.bashrc fi`
* `ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config`
* download vcprompt
  * `curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt`
  * `chmod 755 ~/bin/vcprompt`

## Memcache
* `echo stats | nc 127.0.0.1 11211`

## Vi  
* global search and replace  
  * `:%s/search_string/replacement_string/g`  

