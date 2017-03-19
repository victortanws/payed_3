class MyDebt < ApplicationRecord
  # Direct associations

  belongs_to :other_id,
             :class_name => "User",
             :foreign_key => "other_id"

  belongs_to :initiator,
             :class_name => "User"

  # Indirect associations

  # Validations

end
