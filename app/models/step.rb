class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true, length: { minimum: 10 }
  after_create :assign_order

  def assign_order
    update(order: task.steps.last.order.nil? ? 1 : task.steps.last.order + 1)
  end
end
