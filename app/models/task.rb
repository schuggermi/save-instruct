class Task < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :nfcs, dependent: :destroy
  has_many :employee_tasks, dependent: :destroy
  has_many :users, through: :employee_tasks
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: %i[name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
