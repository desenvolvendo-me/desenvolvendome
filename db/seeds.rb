Evaluation.destroy_all
User.destroy_all
Interest.destroy_all
Language.destroy_all
Technology.destroy_all

Admin.create(email: "marco.castro@desenvolvendo.me", password: "12345abc12345")

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

puts "Os Melhores por Linguagem"
puts "Javascript"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "diegohaz", email: "diegohaz@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "eduardolundgren", email: "eduardolundgren@gmail.com"))

puts "Java"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "andremion", email: "andremion@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "jrvansuita", email: "jrvansuita@gmail.com"))

puts "Ruby"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "fnando", email: "fnando@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "franzejr", email: "franzejr@gmail.com"))

puts "Python"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rochacbruno", email: "rochacbruno@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "iogf", email: "iogf@gmail.com"))

puts "PHP"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "antonioribeiro", email: "antonioribeiro@gmail.com"))
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "zizaco", email: "zizaco@gmail.com"))

puts "Os Melhores por Frameworks"
puts "React"
puts "Laravel"
puts "Rails"
GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rafaelfranca", email: "rafaelfranca@gmail.com"))
