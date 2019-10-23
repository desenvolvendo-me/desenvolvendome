# == Schema Information
#
# Table name: perfis
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  descricao  :string
#  github     :string(255)
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Perfil < ApplicationRecord
  has_many :conhecimentos

  before_validation :check_perfil

  private

  def check_perfil
    github = Github.new
    user = github.getUser(self.github)
    self.nome = user['name']
    self.avatar = user['avatar_url']
    self.descricao = user['bio']
  end
end
