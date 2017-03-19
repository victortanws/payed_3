class PaymentInformation < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :card_number, :numericality => true

end
