class Patient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :doctorpatients
  has_many :doctors, through: :doctorpatients
end
