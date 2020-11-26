class CustomersController < ApplicationController
  before_action :move_to_login

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @trainings = @customer.trainings.includes(:customer)
    @graph = @customer.trainings.pluck(:created_at, :weight )
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    else
      render :edit
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:image, :first_name, :family_name, :first_name_k, :family_name_k, :gender, :birthday, :tel, :postal_code, :prefecture_id, :city, :address, :building, :job_id, :course_id, :height).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
