Then /^I should see the image "(.+)"$/ do |image|
    expect(page).to have_xpath("//img[contains(@src, \"#{image}\")]")
end

class Capybara::XPath
  class << self
    def element(locator)
      append("//*[normalize-space(text())=#{s(locator)}]")
    end
  end
end

When 'I click "$locator"' do |locator|
  msg = "No element found with the content of '#{locator}'"
  locate(:xpath, Capybara::XPath.element(locator), msg).click
end