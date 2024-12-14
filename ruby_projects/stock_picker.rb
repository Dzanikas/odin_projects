# def stock_picker (stock)
#   buy = 0
#   sell = 0
#   profit = 0
#   stock.each_with_index do |day_1, i_1|
#     index_1 = i_1
#     value_1 = day_1
#     stock.each_with_index do |day_2, i_2|
#       index_2 = i_2
#       if index_1 < index_2
#         value_2 = day_2
#         if value_2 < value_1 && value_2 < buy
#           buy = index_2
#         end
#       else
#         next
#       end
#     end
#   end
#   buy
#   sell
#   profit
# end

def stock_picker(stock)
  max_profit = 0
  best_days = []

  stock.each_with_index do |buy_price, buy_day|
    stock.each_with_index do |sell_price, sell_day|
      next if sell_day <= buy_day # Ensure selling happens after buying

      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  best_days
end

stock = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts stock_picker(stock).inspect
