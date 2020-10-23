class TrainingsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @training = Training.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @training = Training.new(training_params)
    if @training.save
    else 
      render :index
    end  
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @training = Training.find(params[:id])
  end

  def update
    training = Training.find(params[:id])
    training.update(training_params)
  end

  private

  def training_params
    params.require(:training).permit(:weight, :body_fat, :blood_pressure_max, :blood_pressure_min, :pulse, :remarks, part:[]).merge(customer_id: params[:customer_id])
  end

end