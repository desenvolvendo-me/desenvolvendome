Contact.destroy_all
FactoryBot.create(:contact, name: "Marco Castro", email: "marcodotcastro@gmail.com")
10.times do
  FactoryBot.create(:contact)
end
puts "Create Contact"

#Alterar para true para carregar usuários reais
if false #true
  Evaluation.destroy_all
  User.destroy_all
  Interest.destroy_all
  Language.destroy_all
  Technology.destroy_all

  AdminUser.create(email: "marco.castro@desenvolvendo.me", password: "12345abc12345")

  puts "Usuários para Teste"
  puts "User: desenvolvendome, Score: 0"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "desenvolvendome", email: "desenvolvendo@gmail.com").login)

  puts "Eu e Amigos"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "marcodotcastro", email: "marcodotcastro@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "MoacirPetry", email: "MoacirPetry@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "NickolasDev", email: "NickolasDev@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "pvm", email: "pvm@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "phalmeida", email: "phalmeida@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "leonnleite", email: "leonnleite@gmail.com").login)

  puts "Os Melhores por Linguagem"
  puts "Javascript"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "diegohaz", email: "diegohaz@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "eduardolundgren", email: "eduardolundgren@gmail.com").login)

  puts "Java"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "andremion", email: "andremion@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "jrvansuita", email: "jrvansuita@gmail.com").login)

  puts "Ruby"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "fnando", email: "fnando@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "franzejr", email: "franzejr@gmail.com").login)

  puts "Python"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rochacbruno", email: "rochacbruno@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "iogf", email: "iogf@gmail.com").login)

  puts "PHP"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "antonioribeiro", email: "antonioribeiro@gmail.com").login)
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "zizaco", email: "zizaco@gmail.com").login)

  puts "Os Melhores por Frameworks"
  puts "React"
  puts "Laravel"
  puts "Rails"
  GenerateProfileJob.perform_later(FactoryBot.create(:user, login: "rafaelfranca", email: "rafaelfranca@gmail.com").login)
end