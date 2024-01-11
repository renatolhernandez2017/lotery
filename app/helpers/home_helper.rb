module HomeHelper
  def get_balance(sale)
    return 0.0 unless sale.present?
    return 0.0 unless sale.send_price.present?

    number_to_currency(sale.price - sale.send_price)
  end

  def get_quantity(sale)
    return 0 unless sale.present?
    return 0 unless sale.send_quantity.present?

    sale.quantity - sale.send_quantity
  end
end
