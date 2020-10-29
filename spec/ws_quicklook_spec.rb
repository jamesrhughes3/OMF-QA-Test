# Story 2 - See a Product on Quicklook Overlay
require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'pages/home_page'
require_relative 'pages/results_page'

feature 'See a Product on Quicklook Overlay' do
  let(:home_page) { HomePage.new }
  let(:results_page) { ResultsPage.new }

  scenario 'Search for a product and verify quicklook details' do
    home_page.close_popup
    home_page.search_product('ladle')
    results_page.product_info
    results_page.open_quicklook
    results_page.verify_product
  end
end

