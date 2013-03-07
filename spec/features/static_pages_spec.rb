require 'spec_helper'

describe "StaticPages" do
  
  describe "About page" do
    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      page.should have_content('About Me')
    end
  end

end
