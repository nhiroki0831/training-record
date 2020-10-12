class CustomersController < ApplicationController
  before_action :move_to_login


  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:image,:first_name, :family_name, :first_name_k, :family_name_k, :gender, :birthday, :tel, :postal_code, :prefecture_id, :city, :address, :building, :job_id, :course_id, :height).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end