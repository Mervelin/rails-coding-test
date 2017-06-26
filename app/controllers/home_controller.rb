class HomeController < ApplicationController

  before_action :authenticate_customer!, except: :summary

  def account
    @orders = Order.where(customer_id: current_customer.id).sorted
  end

  def summary
    @orders =
  end
end
