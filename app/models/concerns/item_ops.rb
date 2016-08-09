module ItemOps
  def total_price
      items.to_a.sum { |i| i.total_price }
  end
end