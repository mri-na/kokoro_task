class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :status, inclusion: { in: [0, 1, 2], message: "%{value} is not a valid status" }
  validates :priority, inclusion: { in: [0, 1, 2], message: "%{value} is not a valid priority" }

  enum status: { not_started: 0, in_progress: 1, completed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
end
