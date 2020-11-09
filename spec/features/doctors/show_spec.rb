require 'rails_helper'

describe 'Dr show page' do
  it 'see all infor for this dr' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    meredith = hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")

    visit("/doctors/#{meredith.id}")

    expect(page).to have_content(meredith.name)
    expect(page).to have_content(meredith.specialty)
    expect(page).to have_content(meredith.university)
    expect(page).to have_content(hospital.name)
  end

  it 'see all infor for this dr' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    meredith = hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")
    alex = hospital.doctors.create!(name: "Alex Karev",
                                        specialty: "General Surgery",
                                        university: "Standford University")
    katie = meredith.patients.create!(name: "Katie Bryce",
                                      age: 24)
    denny = meredith.patients.create!(name: "Denny Duquette",
                                      age: 39)
    rebecca = alex.patients.create!(name: "Rebecca Pope",
                                    age: 32)
    visit("/doctors/#{meredith.id}")

    expect(page).to have_content(katie.name)
    expect(page).to have_content(denny.name)
    expect(page).to_not have_content(rebecca.name)
  end
end
