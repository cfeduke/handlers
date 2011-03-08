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
  
  test ".merb template handler" do
    visit '/handlers/merb'
    expected = %r|<p>MERB template handler is <strong>cool and fast</strong>!</p>|
    assert expected =~ page.body.strip
  end
  
  test "dual template with .merb" do
    email = Notifier.contact("you@example.com")
    assert_equal(2, email.parts.size)
    assert_equal("multipart/alternative", email.mime_type)
    assert_equal("text/plain", email.parts[0].mime_type)
    assert_equal("Dual templates **rocks**!", email.parts[0].body.encoded.strip)
    assert_equal("text/html", email.parts[1].mime_type)
    assert_equal("<p>Dual templates <strong>rocks</strong>!</p>", email.parts[1].body.encoded.strip)
  end
end
