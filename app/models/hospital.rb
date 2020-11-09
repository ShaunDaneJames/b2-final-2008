class Hospital < ApplicationRecord
  validates_presence_of :name

  has_many :doctors

  def number_of_doctors
    doctors.count(:name)
  end

  def unique_list_universities
    doctors.pluck(:university).uniq
  end
end
