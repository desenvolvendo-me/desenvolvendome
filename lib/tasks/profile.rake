require 'benchmark'
require "csv"

namespace :profile do

  desc "Update Profile"
  task :update, [:user_login] => :environment do |task, args|
    Benchmark.bm do |x|
      x.report {
        user = User.find_by_login(args[:user_login])

        if user
          puts "Updated: #{user.login}"
          Profile::Generate.new(user).run
        else
          puts "User: #{args[:user_login]} not exist"
        end
      }
    end
  end

  desc "Update All Profile"
  task update_all: :environment do
    Benchmark.bm do |x|
      x.report {
        total = User.count
        User.all.each_with_index do |user, index|
          puts "Updated[#{index}/#{total}]: #{user.login}"
          Profile::Generate.new(user).run
        end
      }
    end
    puts "Updated All"
  end

  desc "Clear Duplicate User"
  task clean_duplicate: :environment do
    total = User.count
    User.all.each_with_index do |user, index|
      user_duplicate = User.where(login: user.login)
      if user_duplicate.count > 1
        user = user_duplicate.last
        puts "Duplicate[#{index}/#{total}]: #{user.name}"
        user.destroy
      end
    end
  end

  desc "Import Users"
  task import_csv: :environment do
    Benchmark.bm do |x|
      x.report {
        filename = Rails.root + 'tmp/users.csv'
        CSV.foreach(filename) do |row|
          user = User.create(login: row[0], email: row[1], password: Devise.friendly_token[0, 20])
          LoadRepositoriesJob.perform_later(user.login)
        end
      }
    end
    puts "Import Users"
  end


end
