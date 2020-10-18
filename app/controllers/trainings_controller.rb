class TrainingsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @training = Training.new(training_params)
    @training.save
  end

  private

  def training_params
    params.permit(:weight, :body_fat, :blood_pressure_max, :blood_pressure_min, :pulse, :remarks, part:[]).merge(customer_id: params[:customer_id])
  end

end