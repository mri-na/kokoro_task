class Journal < ApplicationRecord
  belongs_to :user

  validates :entry_date, presence: true
  validates :mood,       presence: true
  validates :content,    presence: true
end
