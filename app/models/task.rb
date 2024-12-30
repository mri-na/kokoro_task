class Task < ApplicationRecord
  belongs_to :user
  has_one :mood_option, as: :optionable, dependent: :destroy
  validates :title, presence: true
  validates :status, inclusion: { in: ['未着手', '進行中', '完了'] }
  validates :priority, inclusion: { in: ['優先度３', '優先度２', '優先度１'] }

  enum status: { '未着手': 0, '進行中': 1, '完了': 2 }
  enum priority: { '優先度１': 0, '優先度２': 1, '優先度３': 2 }

  def status_in_japanese
    I18n.t("activerecord.attributes.task.status.#{status}")
  end

  def priority_in_japanese
    I18n.t("activerecord.attributes.task.priority.#{priority}")
  end
end
