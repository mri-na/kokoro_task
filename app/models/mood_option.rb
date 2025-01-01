class MoodOption < ApplicationRecord
  belongs_to :optionable, polymorphic: true

  validates :colors, presence: true, length: { maximum: 3 }
  validates :labels, presence: true, length: { maximum: 3 }

end

