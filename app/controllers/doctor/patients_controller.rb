class Doctor::PatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    DoctorPatient.destroy_record(doctor,patient)
    redirect_to doctor_path(doctor)
  end
end