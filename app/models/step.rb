class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true
  acts_as_list column: :order, scope: :task
end
