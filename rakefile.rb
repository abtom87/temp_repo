require 'rake/clean'

CLEAN.include('*.o')
CLOBBER.include('*.exe')

source_files = Rake::FileList["*.c"]
object_files = source_files.ext(".o")

DATE='\""'
DATE+=`git version | cut -d" "  -f3`
#DATE += `git version | cut -d" "  -f1 ` 
DATE.delete!("\n")
DATE+='"\"'
## TEST_CONST='\""A STRUING"\"'
TEST_CONST=DATE

BRANCH_NAME='\""'
BRANCH_NAME+=`git branch -a | grep ^\* | cut -d " " -f2`
BRANCH_NAME.delete!("\n")
BRANCH_NAME+='"\"'

CURRENT_BRANCH=`git branch -a | grep ^\* | cut -d " " -f2`
CURRENT_BRANCH.delete!("\n")

BRANCH_HASH='\""'
BRANCH_HASH+=`git rev-parse #{CURRENT_BRANCH}`
BRANCH_HASH.delete!("\n")
BRANCH_HASH+='"\"'


task :default => "test_app"

task :clean do
    sh "clear; rm -rfv *.o"
end

desc "Build the binary executable"
file "test_app" => object_files do |task|
  sh  "gcc #{object_files} -o #{task.name} "
end

## -DDATE=\"$(DATE)\" -DDATE=\""13:12:23"\" 
rule '.o' => '.c' do |task|
  sh "gcc -c #{task.source} -DVAR=#{TEST_CONST} -DGIT_BRANCH_NAME=#{BRANCH_NAME} -DGIT_BRANCH_HASH=#{BRANCH_HASH}"
end
