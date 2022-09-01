class Step < ApplicationRecord
  belongs_to :task
  validates :instruction, presence: true, length: { minimum: 10 }
  after_commit :assign_order, on: %i[create]

  def assign_order
    self.order = task.steps.last.order.nil? ? 1 : task.steps.last.order + 1
    send(update_without_callbacks)
  end
end
