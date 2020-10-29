# Normally, I would prefer to use element ID's or name locators to target elements on a site.
# Given that Williams-Sonoma seems to lack element ID's and consistent name locators, I've decided upon Xpath as
# the best choice.
require_relative '../elements/site_elements'

class HomePage
  include Capybara::DSL
  include RSpec::Matchers

  $browser = SiteElements.new("https://www.williams-sonoma.com/")

  def close_popup
    # Email popup must be dealt with before proceeding to test.
    $browser.find_target_element('//*[@id="home"]/div[7]/div/a').click
  end

  def find_menu_element_and_hover
    # In order to avoid an having to write an explicit wait to give the hover menu time to expand, I've included an
    # Xpath for a sub menu header.
    # Hover over the 'COOKS' Tools' menu and wait for the menu to expand
    $browser.hover_menu('//*[@id="topnav-container"]/ul/li[2]/a',
                         '//*[@id="topnav-container"]/ul/li[2]/div/div[1]/div[1]')
  end

  def choose_category
    # Click the 'Slotted Spoons & Spoon Sets' link.
    $browser.find_target_element('//*[@id="topnav-container"]/ul/li[2]/div/div[1]/ul[1]/li[4]/a').click
  end

  def search_product(product)
    $browser.find_target_element('//*[@id="search-field"]').send_keys product, :enter
  end

end
