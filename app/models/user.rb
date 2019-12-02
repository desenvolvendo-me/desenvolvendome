# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  bio                    :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  evaluations_count      :integer
#  followers              :integer
#  following              :integer
#  login                  :string
#  name                   :string
#  office                 :integer
#  provider               :string
#  remember_created_at    :datetime
#  repositories_count     :integer
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  github_id              :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable

  extend FriendlyId
  has_one :profile, dependent: :destroy
  has_many :repositories, dependent: :destroy

  enum office: [:fullstack, :frontend, :backend, :devops]

  validates_presence_of :login, :email

  friendly_id :slug_name, use: :slugged

  def slug_name
    "#{SecureRandom.hex[0..10]}"
  end

  def self.from_omniauth(auth)
    reimport(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.login = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar = auth.info.image
    end
  end

  before_validation :set_default_password
  before_update :start_processing

  def after_import_save(record)
    user = User.find_by_login(record[:login])
    GenerateProfileJob.perform_later(user)
  end

  private

  def self.reimport(auth)
    user = User.find_by_login(auth.info.nickname)
    user.try(:profile).try(:destroy)
    user.try(:repositories).try(:destroy_all)
  end

  def start_processing
    self.profile = Profile.new unless self.profile
    self.profile.update(processing: repositories_count)
  end

  def set_default_password
    self.password = "12345678"
  end
end
