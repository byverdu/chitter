require "data_mapper"
require "./app/data_mapper_setup"


task :auto_upgrade do
	
	DataMapper.auto_upgrade!
	puts 'auto_upgrade enabled'
end

task :auto_migrate do

	DataMapper.auto_migrate!
	puts 'auto_migrate enabled'
end