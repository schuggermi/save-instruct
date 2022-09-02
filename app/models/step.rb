class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true, length: { minimum: 10 }
  # after_create :assign_order_to_steps
end

# Step.by_date

# def assign_order_to_steps
#   order_numbers = [1..100].first(steps.count)
#   task.steps.each do |step|
#     step.order
#   end
