class Task < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :nfcs, dependent: :destroy
  has_many :employee_tasks, dependent: :destroy
  has_many :users, through: :employee_tasks
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :employee_tasks
end
