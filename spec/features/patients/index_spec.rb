require 'rails_helper'

RSpec.describe 'Patient Index Page', type: :feature do
  before(:each) do
    @patient_1 = Patient.create!(name:"Bob",age:16)
    @patient_2 = Patient.create!(name:"Aob",age:17)
    @patient_3 = Patient.create!(name:"Nob",age:18)
    @patient_4 = Patient.create!(name:"Dob",age:19)
    @patient_5 = Patient.create!(name:"Cob",age:19)
  end
  describe "User Story 3, Patient Index Page" do
    it "displays name of all adult patients" do
      visit patients_path
      expect(page).to have_content("Nob")
      expect(page).to have_content("Dob")
      expect(page).to have_content("Cob")

      expect(page).to_not have_content("Bob")
      expect(page).to_not have_content("Aob")
    end
    it "displays names in ascending order" do
      visit patients_path
      expect("Cob").to appear_before("Dob")
      expect("Dob").to appear_before("Nob")
  
    end
  end
end