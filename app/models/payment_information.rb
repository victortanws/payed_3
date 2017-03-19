class PaymentInformation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :card_number, :numericality => true

end
