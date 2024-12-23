class Task < ApplicationRecord
  belongs_to :user
  has_one :mood_option, as: :optionable, dependent: :destroy
  validates :title, presence: true
  validates :status, inclusion: { in: ['not_started', 'in_progress', 'completed'] }
  validates :priority, inclusion: { in: ['low', 'medium', 'high'] }

  enum status: { not_started: 0, in_progress: 1, completed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
end
