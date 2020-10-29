# Story 1 - Add a product to cart
# Normally I would wrap tests in Cucumber but I wanted to stick to the spirit of the assignment and focus my efforts in
# RSpec.  With that in mind, I hope you'll forgive testing features across multiple pages within a single spec file.
# I'm not entirely sure of the standard conventions and I hope you'll understand.

require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'pages/home_page'
require_relative 'pages/product_list_page'
require_relative 'pages/product_page'
require_relative 'pages/cart_page'

feature 'Add a product to cart' do
  let(:home_page) { HomePage.new }
  let(:product_list_page) { ProductListPage.new }
  let(:product_page) { ProductPage.new }
  let(:cart_page) { CartPage.new }

  # I built this with an implicit wait where necessary.  It passes 99% of the time, but occasionally will hiccup and
  # fail outright due to an element not being in the location expected when the click occurs.  I tried to track this
  # bug down but it's so intermittent that I can't determine if it's a lag problem, a DOM issue, or just my having
  # made a mistake somewhere.  If this fails when you run it and returns x,y coordinates, please retry!
  scenario 'Add a product and validate on checkout page' do
    home_page.close_popup
    home_page.find_menu_element_and_hover
    home_page.choose_category
    product_list_page.choose_product
    product_page.product_info
    product_page.add_to_cart
    product_page.checkout
    cart_page.verify_product
  end
end




