module NumberFormatter
  def clean_to_two_digits(number)
    (number * 100).floor / 100.0
  end
end
