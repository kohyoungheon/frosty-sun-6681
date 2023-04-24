require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe "class methods" do
    before (:each) do
        @patient_1 = Patient.create!(name:"Bob",age:16)
        @patient_2 = Patient.create!(name:"Cob",age:18)
        @patient_3 = Patient.create!(name:"Dob",age:19)
        @patient_4 = Patient.create!(name:"Zob",age:20)
      end

    describe "#order_adults" do
      it "order all patients over 18 alphabetically" do
        expect(Patient.order_adults.first).to eq(@patient_2)
        expect(Patient.order_adults.second).to eq(@patient_3)
        expect(Patient.order_adults.third).to eq(@patient_4)
      end
    end
  end
end