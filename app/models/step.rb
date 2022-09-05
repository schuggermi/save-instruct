class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true, length: { minimum: 10 }
  acts_as_list column: :order, scope: :task
end
