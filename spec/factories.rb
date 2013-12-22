FactoryGirl.define do
  factory :stock do
    name "CITI"
    ticker "CITI"
    price 100.0
    quantity 100
  end

  factory :stock_price do
    bid_id 1
    ask_id 1
    price 10
    quantity 100
    price_unit 100
    stock
  end
end