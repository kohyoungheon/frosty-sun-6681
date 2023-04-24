require 'rails_helper'

RSpec.describe DoctorPatient do
  it {should belong_to :patient}
  it {should belong_to :doctor}

  describe "class methods" do
    before(:each) do
        @hospital_1 = Hospital.create!(name:"Hospital 1")

        @doctor_1 = @hospital_1.doctors.create!(name:"Doctor Juan",specialty: "Bones", university: "CU Denver")

        @patient_1 = Patient.create!(name:"Bob",age:16)
        @patient_2 = Patient.create!(name:"Cob",age:17)
        @patient_3 = Patient.create!(name:"Dob",age:18)

        @dp_1 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_1)
        @dp_2 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_2)
        @dp_3 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_3)
    end
    describe "destroy_record" do
      it "destroys doctor patient record given ids" do

        expect(@doctor_1.patients.pluck(:name)).to eq(["Bob", "Cob", "Dob"])
        DoctorPatient.destroy_record(@doctor_1,@patient_1)
        expect(@doctor_1.patients.pluck(:name)).to eq(["Cob", "Dob"])
        DoctorPatient.destroy_record(@doctor_1,@patient_2)
        expect(@doctor_1.patients.pluck(:name)).to eq(["Dob"])
        
      end
    end


  end


end