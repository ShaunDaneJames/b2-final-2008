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

  it "I see a unique list of universities this hospital's doctors attended" do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    meredith = hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")
    alex = hospital.doctors.create!(name: "Alex Karev",
                                        specialty: "General Surgery",
                                        university: "Standford University")
    pseudoalex = hospital.doctors.create!(name: "Imposter",
                                        specialty: "General Surgery",
                                        university: "Standford University")

    visit("/hospitals/#{hospital.id}")

    expect(page).to have_content(["Harvard University", "Standford University"])
  end
end
