require 'rails_helper'

describe 'Hospital show page' do
  it 'I see the name of the hospital and number of doctors employeed' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    meredith = hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")
    alex = hospital.doctors.create!(name: "Alex Karev",
                                        specialty: "General Surgery",
                                        university: "Standford University")

    visit("/hospitals/#{hospital.id}")

    expect(page).to have_content(hospital.name)
    expect(page).to have_content(hospital.doctors.count)
  end
end
