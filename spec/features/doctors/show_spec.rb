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
  end
end
