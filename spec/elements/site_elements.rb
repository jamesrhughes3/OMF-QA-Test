require 'selenium-webdriver'
require 'rspec/expectations'

class SiteElements
  include Capybara::DSL
  include RSpec::Matchers

  def initialize(url)
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(timeout: 20)
    @driver.manage.window.maximize
    @driver.navigate.to url
  end

  def find_target_element(target)
    @wait.until { @driver.find_element(:xpath, target).displayed? }
    @driver.find_element(:xpath, target)
  end

  def hover_menu(target, validate)
    el = @driver.find_element(:xpath, target)
    @driver.action.move_to(el).perform
    @wait.until { @driver.find_element(:xpath, validate).displayed? }
  end

end