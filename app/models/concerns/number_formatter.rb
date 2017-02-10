module NumberFormatter
  def clean_to_two_digits(number)
    (number * 1000).floor / 1000.0
  end
end
