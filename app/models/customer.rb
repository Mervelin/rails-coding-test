class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  def customer_category
    select('customer.id as customer_id', 'customer.name as customer_name',
           'category.id as category_id', 'category.name as category_name')
      .joins(:orders).joins(:products).joins(:category)
  end
end
