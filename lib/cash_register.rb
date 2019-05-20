require "pry"
class CashRegister
    attr_reader :discount, :items
    attr_accessor :total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity=1)
        amt = price * quantity
        @total += amt
        quantity.times do 
            @items << title
            @prices << price
        end
    end

    def apply_discount
        # binding.pry
        if @discount > 0
            discount_amt = (@total*(@discount * 0.01))
            @total = (@total - discount_amt).to_i
            "After the discount, the total comes to $#{total}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        last_item = @items.pop
        last_price = @prices.pop
        @total -= last_price
    end
end

# Ways to improve
# I'd like to create a hash with key(item) and values (price)