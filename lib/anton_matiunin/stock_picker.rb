module AntonMatiunin
  class StockPicker
    attr_reader :input_array

    def initialize(input_array: [])
      @input_array = input_array.to_a
    end

    def pick
      best_days = []
      max_profit = 0
      input_array.each_with_index do |buy_price, buy_day|
        input_array.each_with_index do |sell_price, sell_day|
          current_profit = sell_price - buy_price
          if sell_day > buy_day && current_profit > max_profit
            max_profit = current_profit
            best_days[0], best_days[1] = buy_day, sell_day
          end
        end
      end

      best_days
    end
  end
end
