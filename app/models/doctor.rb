class Doctor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :university

  belongs_to :hospital

  has_many :doctorpatients
  has_many :patients, through: :doctorpatients
end
