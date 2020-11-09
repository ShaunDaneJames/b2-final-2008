require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }

    it { should have_many :doctorpatients}
    it { should have_many(:doctors).through(:doctorpatients)}
  end
end
