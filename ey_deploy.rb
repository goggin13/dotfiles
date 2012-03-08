

unless ARGV.length > 1
  puts "usage: deploy <environment> <ref> <migrate>"
  puts "* <environment> : required : one of [prod, staging, sandbox]"
  puts "* <ref> : required : the branch to push"
  puts "* <migrate> : optional : pass 'migrate', otherwise no migrations performed"
  puts "\nExamples:"
  puts "\t deploy stag staging # deploy staging branch to staging server"
  puts "\t deploy stag staging migrate # deploy staging branch to staging server with migrations"
  puts "\t deploy prod master migrate # deploy master branch to production server with migrations"
  puts "\t deploy -h # view these options"
else

  env = ARGV[0].downcase
  ref = ARGV[1]
  migrate = ARGV[2] == 'migrate'

  cmd = "ey deploy -e #{env} -ref #{ref}"
  cmd += " --migrate 'bundle exec rake db:migrate'" if migrate

  if env =~ /^p/
    msg = "\n***** DEPLOYING TO PRODUCTION #{migrate ? 'WITH MIGRATIONS' : ''} *****\n\n" 
    puts msg
  end

  puts cmd 
  puts "\ncontinue deploy? (Y/n)\n"
  ARGV.clear
  if gets.chomp == "Y"
    system cmd
  end
end