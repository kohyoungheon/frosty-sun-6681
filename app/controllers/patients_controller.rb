class PatientsController < ApplicationController
  def index
    @patients = Patient.order_adults
  end
end