class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true, length: { minimum: 10 }
end
