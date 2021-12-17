# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  hide       :boolean
#  processing :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  paginates_per 24

  belongs_to :user, optional: true
  has_many :knowledges, dependent: :destroy
  has_one :evaluation, dependent: :destroy

  scope :evaluation, -> (args) {
    joins(:evaluation)
        .where("evaluations.evaluation_type = ?", Evaluation.evaluation_types[args[:evaluation_type]])
        .limit(args[:limit])
        .order("evaluations.xp": :desc)
  }

  scope :not_hidden, -> {
    where(hide: [false, nil])
  }

  scope :hidden, -> {
    where(hide: true)
  }

  def level
    evaluation_type = self.try(:evaluation).try(:evaluation_type)
    evaluation_type = Evaluation.human_enum_name(:evaluation_types, evaluation_type)
    evaluation_level = self.try(:evaluation).try(:level)
    evaluation_xp = self.try(:evaluation).try(:xp)

    evaluation_level.nil? ? "Em Avaliação" : "#{evaluation_type} com Lvl #{evaluation_level} e Xp #{evaluation_xp}"
  end

  def repositories_to_work
    started = 0..50
    novice = 50..100
    knight = 100..300

    user.repositories.where(commits_count: instance_eval(evaluation.evaluation_type)).order(commits_count: :desc).first(3)
  end

  def number_xp

  end


end
