# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  bio                    :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  evaluation_last        :datetime
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
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  github_id              :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  paginates_per 16

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :profile, dependent: :destroy
  has_many :repositories, dependent: :destroy
  has_many :visits, class_name: "Ahoy::Visit"
  has_many :events, class_name: "Ahoy::Event"

  enum office: [:fullstack, :frontend, :backend, :devops]

  validates_presence_of :login, :email

  def self.from_omniauth(auth)
    where(login: auth.info.nickname).first_or_create do |user|
      user.login = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  before_update :start_processing, :set_evaluation_last

  def after_import_save(record)
    GenerateProfileJob.perform_later(record[:login])
  end

  def to_s
    login
  end

  def can_evaluation?
    DateTime.now >= minimum_evaluation_period
  end

  def minimum_evaluation_period
    bug_timezone = 3.hours #FIXME: ActiveRecord::Base.default_timezone must be :utc to use Groupdate
    (evaluation_last + 1.day) + bug_timezone
  end

  scope :empty_github, -> {
    where(repositories_count: 0)
  }

  private

  def start_processing
    self.profile = Profile.new unless self.profile
    self.profile.update(processing: self.repositories_count)
  end

  def set_evaluation_last
    update_column("evaluation_last", DateTime.now)
  end

end
