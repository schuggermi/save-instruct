class Task < ApplicationRecord
  has_many :steps
  has_many :nfcs
  has_many :employee_tasks
  has_many :users, through: :employee_tasks
  accepts_nested_attributes_for :steps
end
