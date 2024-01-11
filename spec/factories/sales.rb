FactoryBot.define do
  factory :sale do
    price { 1.5 }
    quantity { 1 }
    send_quantity { 1 }
    send_price { 1.5 }
  end
end
