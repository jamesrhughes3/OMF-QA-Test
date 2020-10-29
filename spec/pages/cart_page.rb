require_relative '../elements/site_elements'

class CartPage
  include Capybara::DSL
  include RSpec::Matchers

  def verify_product
    # I was going to do name and price validation, but the name changes between the product I chose and the description
    # in the cart.  After checking other products, some descriptions change and some do not.  Given Joe's instruction
    # regarding this not needing to scale or stand the test of time, I hope you'll understand why I haven't written more
    # complex string validation logic that would function regardless of the description changing between the Product
    # and the Cart page.
    # I'm also pretty sure I could shrink the next bit to one line, but I'm still shaking the rust off.
    if $price != $browser.find_target_element('//*[@id="cartForm"]/div/div[1]/div[3]/div[3]/div/div[2]/div[3]/div[3]/div[2]/span/span/span[2]').attribute('innerText')
      fail
    end
  end
end