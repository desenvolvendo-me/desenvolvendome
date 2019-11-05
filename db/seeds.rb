puts "User: desenvolvendome, Score: 0"
FactoryBot.create(:user, :with_repositories)

puts "User: leonardoscorza, Score: 0.6"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "leonardoscorza"))

#FIXME: Pq os três tem a mesma nota?
puts "User: marcodotcastro, Score: 2.2" #Score: 1
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "marcodotcastro"))

puts "User: lucascaton, Score: 2.2" #Score: 2
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "lucascaton"))

puts "User: rafaelfranca, Score: 2.2" #Score: 3
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rafaelfranca"))

puts "User: kamranahmedse, Score: 4.6"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "kamranahmedse"))