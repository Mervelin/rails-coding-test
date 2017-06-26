class Order < ActiveRecord::Base
  has_one :product
  belongs_to :customer

  enum status: [:daft, :confirmed, :canceled]

  scope :sorted, -> { order('status ASC') }

  def summary_products
    select('products.name')
      .count('products.id').joins(:product)
      .where('orders.created_at > :start_date', start_date: Date.beginning_of_week())
      .group('products.id')
  end

  def summary_items
    select('items.name')
      .count('items.id').joins(:product).joins(:items)
      .where('orders.created_at > :start_date', start_date: Date.beginning_of_week())
      .group('items.id')
  end

end
