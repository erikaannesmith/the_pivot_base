require 'rails_helper'

describe "As a user" do
  describe "visits /orders" do
    it "can see all past orders" do
      user = create(:user)
      item = create(:item, price: 5.00)
      order = create(:order, user: user) 
			create(:order_item, order_id: order.id, item: item, quantity: 2, unit_price: item.price)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/orders'
      click_on order.id

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content("Total: $10.00")
    end
  end
end
