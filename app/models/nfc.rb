class Nfc < ApplicationRecord
  belongs_to :task
  validates :serial_number, presence: true, uniqueness: true
  validates :url, presence: true, length: { minimum: 18 }
  validates :position, presence: true

  def existing?(serial_number)
    Nfc.find_by(serial_number: serial_number)
  end
end
