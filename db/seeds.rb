User.destroy_all
Interest.destroy_all
Language.destroy_all
Technology.destroy_all


puts "Usuários para Teste"
puts "User: desenvolvendome, Score: 0"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "desenvolvendome", email: "desenvolvendo@gmail.com"))

puts "Eu e Amigos"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "marcodotcastro", email: "marcodotcastro@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "MoacirPetry", email: "MoacirPetry@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "NickolasDev", email: "NickolasDev@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "pvm", email: "pvm@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "phalmeida", email: "phalmeida@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "leonnleite", email: "leonnleite@gmail.com"))

# puts "Desenvolvedores"
# puts "User: leonardoscorza, Score: 0.6"
# GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "leonardoscorza", email: "leonardoscorza@gmail.com"))
# puts "User: lucascaton, Score: 3.8"
# GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "lucascaton", email: "lucascaton@gmail.com"))
# puts "User: rafaelfranca, Score: 3.6" #Score: 3
# GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rafaelfranca", email: "rafaelfranca@gmail.com"))
# puts "User: kamranahmedse, Score: 4.2"
# GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "kamranahmedse", email: "kamranahmedse@gmail.com"))