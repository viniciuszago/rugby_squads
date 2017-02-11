require 'rake/testtask'

# Task to read all tests on `specs` file
Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['specs/**/*_spec.rb']
  t.verbose = true
  t.warning = true
end
