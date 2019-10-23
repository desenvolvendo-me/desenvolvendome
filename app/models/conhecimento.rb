class Conhecimento < ApplicationRecord
  belongs_to :perfil, optional: true
  belongs_to :tecnologia, optional: true
end
