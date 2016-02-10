group 'tests' do
  guard :rspec, cmd: 'bundle exec rspec' do
    # spec helpers
    watch(%r{^spec/.+_helper\.rb$}) { |m| 'spec' }

    # changes to spec files
    watch(%r{^spec/.+_spec\.rb}) { |m| "#{m[0]}" }

    # changes to gem project file
    watch('lib/api_monkey.rb') { |m| 'spec' }
    watch(%r{^lib/.+\.rb}) do |m|
      puts "caught change #{m}"
      "spec/#{m[0].split('/').last.split('.rb').first}_spec.rb"
    end
  end
end
