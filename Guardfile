guard :rspec, cmd: 'bundle exec rspec --color' do
  watch(%r{^spec/models/.+_spec\.rb$})
  watch(%r{^spec/integration/.+_spec\.rb$})
  watch('app.rb'){ "spec/integration"}
  watch(%r{^models/(.+)\.rb$})     { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^views/(.+)\.haml$})     { |m| "spec/integration/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
