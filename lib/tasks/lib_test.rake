Rake::TestTask.new do |t|
  t.libs << 'app/lib' << 'test'
  t.test_files = FileList['test/lib/**/*_test.rb']
  t.verbose = true
end
