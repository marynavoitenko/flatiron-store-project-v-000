module StoresHelper
  def number_to_currency(number)
    "$" + (number.to_f / 100).to_s
  end
end
