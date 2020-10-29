require_relative '../elements/site_elements'

class ResultsPage
  include Capybara::DSL
  include RSpec::Matchers

  def product_info
    # I went with the second result displayed here, just for clarity.
    String @name = $browser.find_target_element('//*[@id="search-tiles"]/ul/li[2]/div[2]/a').attribute('innerText')
    String @price = $browser.find_target_element('//*[@id="search-tiles"]/ul/li[2]/div[2]/span/span').attribute('innerText')
  end

  def open_quicklook
    $browser.find_target_element('//*[@id="search-tiles"]/ul/li[2]/div[2]/quick-look/div/a/span').click
  end

  def verify_product
    if @name != $browser.find_target_element('//*[@id="purchasing-container"]/div[2]/div/h1').attribute('innerText')
      fail
    end
    # The $ is present in the innerText when getting the product info, but isn't present in the innerText on the
    # Quicklook page.  Decided to append the value to a $ here for validation purposes.
    #String quickPrice = $browser.find_target_element('//*[@id="productSubsetItem1"]/div/div/div[2]/span/span/span/span[2]').attribute('innerText')
    if @price != "$#{$browser.find_target_element('//*[@id="productSubsetItem1"]/div/div/div[2]/span/span/span/span[2]').attribute('innerText')}"
      fail
    end
  end
end