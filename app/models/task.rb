class Task < ApplicationRecord
  belongs_to :user
  has_one :mood_option, as: :optionable, dependent: :destroy
  validates :title, presence: true
  validates :status, inclusion: { in: ['未着手', '進行中', '完了'] }
  validates :priority, inclusion: { in: ['優先度３', '優先度２', '優先度１'] }

  enum status: { not_started: 0, in_progress: 1, completed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  def status_in_japanese
    I18n.t("activerecord.attributes.task.status.#{status}")
  end

  def priority_in_japanese
    I18n.t("activerecord.attributes.task.priority.#{priority}")
  end
end
