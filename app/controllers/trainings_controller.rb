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
    @customer = Customer.find(params[:customer_id])
    training = Training.find(params[:id])
    if training.update(training_params_edit)
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    training = Training.find(params[:id])
    training.destroy
    redirect_to customer_path(@customer.id)
  end

  private

  def training_params
    params.permit(:weight, :body_fat, :blood_pressure_max, :blood_pressure_min, :pulse, :remarks, part:[]).merge(customer_id: params[:customer_id])
  end

  def training_params_edit
    params.require(:training).permit(:weight, :body_fat, :blood_pressure_max, :blood_pressure_min, :pulse, :remarks, part:[]).merge(customer_id: params[:customer_id])
  end

end