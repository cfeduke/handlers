require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test ".rb template handler" do
    visit '/handlers/index'
    assert_match(/This is my first <b>template handler<\/b>!/, page.body)
  end
  
  test ".string template handler" do
    visit '/handlers/show'
    assert_match(/Congratulations!  You just created another template handler!/, page.body)
  end
  
  test ".md template handler" do
    visit '/handlers/rdiscount'
    expected = %r|<p>RDiscount is <em>cool</em> and <strong>fast</strong>!</p>|
    assert expected =~ page.body
  end
end
