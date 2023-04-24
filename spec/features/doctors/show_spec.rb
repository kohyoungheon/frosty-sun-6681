require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  before(:each) do
    @hospital_1 = Hospital.create!(name:"Hospital 1")
    @hospital_2 = Hospital.create!(name:"Hospital 2")

    @doctor_1 = @hospital_1.doctors.create!(name:"Doctor Juan",specialty: "Bones", university: "CU Denver")
    @doctor_2 = @hospital_1.doctors.create!(name:"Doctor Dos",specialty: "Muscles", university: "CU Boulder")
    @doctor_3 = @hospital_2.doctors.create!(name:"Doctor Trey",specialty: "Blood", university: "CU Fort Collins")

    @patient_1 = Patient.create!(name:"Bob",age:16)
    @patient_2 = Patient.create!(name:"Cob",age:17)
    @patient_3 = Patient.create!(name:"Dob",age:18)
    @patient_4 = Patient.create!(name:"Rob",age:19)

    @dp_1 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_1)
    @dp_2 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_2)

    @dp_3 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_1)
    @dp_4 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_2)

    @dp_5 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_3)
    @dp_6 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_4)
  end

  describe "User Story 1, Doctors Show Page" do
    it "displays doctor's name, specialty, and university" do
      visit doctor_path(@doctor_1)
      expect(page).to have_content("Name: Doctor Juan")
      expect(page).to have_content("Specialty: Bones")
      expect(page).to have_content("University: CU Denver")

      expect(page).to_not have_content("Name: Doctor Dos")
      expect(page).to_not have_content("Specialty: Muscles")
      expect(page).to_not have_content("University: CU Boulder")

      visit doctor_path(@doctor_2)
      expect(page).to have_content("Name: Doctor Dos")
      expect(page).to have_content("Specialty: Muscles")
      expect(page).to have_content("University: CU Boulder")

      expect(page).to_not have_content("Name: Doctor Juan")
      expect(page).to_not have_content("Specialty: Bones")
      expect(page).to_not have_content("University: CU Denver")
    end
    it "displays name of doctor's hospital and all of the doctor's patients" do
      visit doctor_path(@doctor_1)
      expect(page).to have_content("Hospital: Hospital 1")
      expect(page).to have_content("Patients: Bob Delete #{@patient_1.id} Cob Delete #{@patient_2.id}")

      visit doctor_path(@doctor_3)
      expect(page).to have_content("Hospital: Hospital 2")
      expect(page).to have_content("Patients: Bob Delete #{@patient_1.id} Cob Delete #{@patient_2.id} Dob Delete #{@patient_3.id} Rob Delete #{@patient_4.id}")
    end
  end

  describe "User Story 2, Remove a Patient from a Doctor" do
    it "displays a button next to each patient to remove from doctor's cases" do
      visit doctor_path(@doctor_1)
      expect(page).to have_content("Patients: Bob Delete #{@patient_1.id} Cob Delete #{@patient_2.id}")
      visit doctor_path(@doctor_3)
      expect(page).to have_content("Patients: Bob Delete #{@patient_1.id} Cob Delete #{@patient_2.id} Dob Delete #{@patient_3.id} Rob Delete #{@patient_4.id}")
    end
    it "clicking redirects to doctor show page where patient is gone" do
      visit doctor_path(@doctor_1)
      click_link("Delete #{@patient_1.id}")
      expect(current_path).to eq(doctor_path(@doctor_1))
      expect(page).to_not have_content("Bob")
    end
    it "does not affect other doctors caring for same patient" do
      visit doctor_path(@doctor_1)
      click_link("Delete #{@patient_1.id}")
      expect(current_path).to eq(doctor_path(@doctor_1))
      expect(page).to_not have_content("Bob")

      visit doctor_path(@doctor_3)
      expect(page).to have_content("Bob Delete #{@patient_1.id}")
    end
  end
end
