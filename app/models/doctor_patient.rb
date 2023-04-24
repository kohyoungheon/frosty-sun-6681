class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def self.destroy_record(doctor,patient)
    where(doctor_id: doctor.id, patient_id: patient.id).destroy_all
  end
end