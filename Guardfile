guard :rspec, cmd: 'bundle exec rspec --color' do
  watch(%r{^spec/models/.+_spec\.rb$})
  watch(%r{^models/(.+)\.rb$})     { |m| "spec/models/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
