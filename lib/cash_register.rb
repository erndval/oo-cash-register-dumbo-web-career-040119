require 'pry'

class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @cart = []
    @total_array = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @total_array << price.to_f * quantity.to_f
    quantity.times {@cart << title}
    @total = @total_array.sum
  end

  def apply_discount
    if @discount > 0
      @total = @total - @total*@discount.to_f/100
      "After the discount, the total comes to $#{@total.to_i}."
  else
      "There is no discount to apply."
  end
  end

  def items
    @cart
  end

  def void_last_transaction
    @cart.pop
    @total_array.pop
    @total = @total_array.sum
  end
end
