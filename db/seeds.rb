puts "User: desenvolvendome, Score: 0"
FactoryBot.create(:user, :with_repositories, email: "desenvolvendo@gmail.com")

puts "User: leonardoscorza, Score: 0.6"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "leonardoscorza", email: "leonardoscorza@gmail.com"))

#FIXME: Pq os três tem a mesma nota?
puts "User: marcodotcastro, Score: 1.2" #Score: 1
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "marcodotcastro", email: "marcodotcastro@gmail.com"))

puts "User: lucascaton, Score: 2.2" #Score: 2
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "lucascaton", email: "lucascaton@gmail.com"))

puts "User: rafaelfranca, Score: 2.2" #Score: 3
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rafaelfranca", email: "rafaelfranca@gmail.com"))

puts "User: kamranahmedse, Score: 4.6"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "kamranahmedse", email: "kamranahmedse@gmail.com"))