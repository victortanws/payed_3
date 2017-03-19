class User < ApplicationRecord
  # Direct associations

  has_many   :creditordebitors,
             :class_name => "Payment",
             :foreign_key => "receiver_id",
             :dependent => :destroy

  has_many   :payments,
             :foreign_key => "initiator_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :payment_informations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
