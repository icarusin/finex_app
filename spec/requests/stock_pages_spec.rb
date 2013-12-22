require 'spec_helper'

describe "Stock Pages" do

  subject {page}

=begin
describe "stocks display page" do

before { visit add_path}

it {should have_selector('h1', text: "Add Stock")}
it {should have_selector('title', text: "Add Stock")}

end
=end

  describe "stock page details" do
    let(:stock) {FactoryGirl.create(:stock)}
    before {visit stock_path(stock)}

    it {should have_selector('h1', text: "CITI")}
    it {should have_selector('title', text: "CITI")}

  end

  describe "Add Stock" do

    before { visit add_path }

    let(:submit) { "Add new stock" }

    describe "with invalid information" do
      it "should not create a stock" do
        expect { click_button submit }.not_to change(Stock, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Barclays"
        fill_in "Ticker",        with: "BRCL"
        fill_in "Price",     with: 50.0
        fill_in "Quantity", with: 50
      end

      it "should create a stock" do
        expect { click_button submit }.to change(Stock, :count).by(1)
      end
    end
  end
end
