Then /^I should see the image "(.+)"$/ do |image|
    expect(page).to have_xpath("//img[contains(@src, \"#{image}\")]")
end

When /^I press "([^\"]*)" within "([^\"]*)"$/ do |button,scope_selector|
  within(scope_selector) do      
    click_button(button)
  end
end