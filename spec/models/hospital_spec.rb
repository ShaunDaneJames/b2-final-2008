require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'instance-methods' do
    it 'number_of_doctors' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      meredith = hospital.doctors.create!(name: "Meredith Grey",
                                          specialty: "General Surgery",
                                          university: "Harvard University")
      alex = hospital.doctors.create!(name: "Alex Karev",
                                          specialty: "General Surgery",
                                          university: "Standford University")

      expect(hospital.number_of_doctors).to eq(2)
    end
  end
end
