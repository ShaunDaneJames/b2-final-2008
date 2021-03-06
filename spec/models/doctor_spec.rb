require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :university }

    it { should belong_to :hospital}

    it { should have_many :doctorpatients}
    it { should have_many(:patients).through(:doctorpatients)}
  end
end
