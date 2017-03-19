class Payment < ApplicationRecord
  # Direct associations

  belongs_to :other_id,
             :class_name => "User",
             :foreign_key => "receiver_id"

  belongs_to :initiator,
             :class_name => "User"

  # Indirect associations

  # Validations

end
