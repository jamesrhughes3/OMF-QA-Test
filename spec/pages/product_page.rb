require_relative '../elements/site_elements'

class ProductPage
  include Capybara::DSL
  include RSpec::Matchers

  def product_info
    # Grabbing the price for validation in the Cart.
    String $price = $browser.find_target_element('//*[@id="productSubsetItem1"]/div/div/div[2]/span/span/span/span[2]').attribute('innerText')
  end

  def add_to_cart
    $browser.find_target_element('//*[@id="primaryGroup_addToCart_0"]').click
  end

  def checkout
    $browser.find_target_element('//*[@id="anchor-btn-checkout"]').click
  end
end
