require 'rake/clean'

CLEAN.include('*.o')
CLOBBER.include('*.exe')

source_files = Rake::FileList["*.c"]
object_files = source_files.ext(".o")


## TEST_CONST='\""A STRING"\"'
#date_var+=`git version | cut -d" "  -f3`
#DATE += `git version | cut -d" "  -f1 ` 
time_var='\""'
time_var+=`date  +%H.%M.%S.%N_%d-%m-%Y`
time_var.delete!("\n")
time_var+='"\"'
TIME_CONST=time_var


var_branch_name='\""'
var_branch_name+=`git branch -a | grep ^\* | cut -d " " -f2`
var_branch_name.delete!("\n")
var_branch_name+='"\"'
BRANCH_NAME = var_branch_name

CURRENT_BRANCH=`git branch -a | grep ^\* | cut -d " " -f2`
CURRENT_BRANCH.delete!("\n")

var_branch_hash='\""'
var_branch_hash+=`git rev-parse #{CURRENT_BRANCH}`
var_branch_hash.delete!("\n")
var_branch_hash+='"\"'
BRANCH_HASH=var_branch_hash

task :default => "test_app"

task :clean do
    sh "clear; rm -rfv *.o"
end
asdasdas
desc "Build the binary executable"
file "test_app" => object_files do |task|
  sh  "gcc #{object_files} -o #{task.name} "
end

## -DDATE=\"$(DATE)\" -DDATE=\""13:12:23"\" 
rule '.o' => '.c' do |task|
  sh "gcc -c #{task.source} -DVAR=#{TIME_CONST} -DGIT_BRANCH_NAME=#{BRANCH_NAME} -DGIT_BRANCH_HASH=#{BRANCH_HASH}"
end

asdasdas
