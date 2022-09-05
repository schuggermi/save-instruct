class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :employee_tasks, dependent: :destroy
  has_many :tasks, through: :employee_tasks
  has_many :visits

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_employee,
  against: [ :first_name, :last_name, :rank ],
  associated_against: {
    tasks: [ :name, :description ]
    }, using: {
    tsearch: { prefix: true }
  }

  def admin?
    self.admin == true
  end
end
