class Nfc < ApplicationRecord
  belongs_to :task
  validates :serial_number, presence: true, uniqueness: true
  validates :url, presence: true
  validates :position, presence: true

  def existing?(serial_number)
    Nfc.find_by(serial_number:)
  end
end
