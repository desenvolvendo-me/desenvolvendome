namespace :profile do

  desc "Update Profile"
  task :update, [:user_login] => :environment do |task, args|
    user = User.find_by_login(args[:user_login])

    if user
      Profile::Generate.new(user).run
      puts "Updated: #{user.name}"
    else
      puts "User: #{args[:user_login]} not exist"
    end

  end

  desc "Update All Profile"
  task update_all: :environment do
    User.all.each do |user|
      Profile::Generate.new(user).run
      puts "Updated: #{user.name}"
    end
    puts "Updated All"
  end

  desc "Clear Duplicate User"
  task clean_duplicate: :environment do
    User.all.each do |user|
      user_duplicate = User.where(login: user.login)
      if user_duplicate.count > 1
        user = user_duplicate.last
        puts "Duplicate: #{user.name}"
        user.destroy
      end
    end
  end

end
