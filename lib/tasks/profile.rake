require 'benchmark'
require "csv"

namespace :profile do

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
          unless User.find_by_login(row[2])
            user = User.create(login: row[2], email: row[10], password: Devise.friendly_token[0, 20])
            LoadRepositoriesJob.perform_later(user.login)
          end
        end
      }
    end
    puts "Import Users"
  end

  desc "Evaluation Repositories"
  task evaluation_repositories: :environment do
    Benchmark.bm do |x|
      x.report {
        User.all.each do |user|
          EvaluationRepositoriesJob.perform_later(user.login)
        end
      }
    end
    puts "Evaluation Respositorios"
  end

end
