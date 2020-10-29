require_relative '../elements/site_elements'

class ProductListPage
  include Capybara::DSL
  include RSpec::Matchers

  def choose_product
    # Using Xpath here will let us select the top-middle product regardless of what it is.
    $browser.find_target_element('//*[@id="subCatListContainer"]/ul/li[2]/a[2]').click
  end

end