FactoryBot.define do
  factory :conhecimento do
    experiencia {0.7}

    trait :com_perfil_e_tecnologia do
      before(:create) do |conhecimento|
        conhecimento.update(perfil: create(:perfil), tecnologia: create(:tecnologia))
      end
    end

  end
end
