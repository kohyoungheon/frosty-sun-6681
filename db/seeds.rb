# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital_1 = Hospital.create!(name:"Hospital 1")
@hospital_2 = Hospital.create!(name:"Hospital 2")

@doctor_1 = @hospital_1.doctors.create!(name:"Doctor Juan",specialty: "Bones", university: "CU Denver")
@doctor_2 = @hospital_1.doctors.create!(name:"Doctor Dos",specialty: "Muscles", university: "CU Boulder")
@doctor_3 = @hospital_2.doctors.create!(name:"Doctor Trey",specialty: "Blood", university: "CU Fort Collins")

@patient_1 = Patient.create!(name:"Bob",age:16)
@patient_2 = Patient.create!(name:"Cob",age:17)
@patient_3 = Patient.create!(name:"Dob",age:18)
@patient_4 = Patient.create!(name:"Rob",age:19)
@patient_5 = Patient.create!(name:"Xob",age:20)
@patient_6 = Patient.create!(name:"Yob",age:21)
@patient_7 = Patient.create!(name:"Zob",age:22)

@dp_1 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_1)
@dp_2 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_2)
@dp_3 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_3)
@dp_4 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_4)
@dp_5 = DoctorPatient.create!(doctor:@doctor_1, patient:@patient_5)

@dp_5 = DoctorPatient.create!(doctor:@doctor_2, patient:@patient_4)
@dp_6 = DoctorPatient.create!(doctor:@doctor_2, patient:@patient_5)
@dp_7 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_6)
@dp_8 = DoctorPatient.create!(doctor:@doctor_3, patient:@patient_7)