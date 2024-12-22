class Journal < ApplicationRecord
  belongs_to :user
  has_one :mood_option, as: :optionable, dependent: :destroy

  validates :entry_date, presence: true
  validates :content,    presence: true
end
