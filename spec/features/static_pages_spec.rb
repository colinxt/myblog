require 'spec_helper'

describe "StaticPages" do
  
  subject {page}

  describe "About page" do
    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      page.should have_content('About Me')
    end
  end

  describe "Home page" do
    describe "pagination" do
      before(:all) { 30.times { Post.create(title:"test pagination",
                                            content:"test",
                                            public: true)}}
      after(:all) { Post.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each post" do
        Post.paginate(page: 1).each do |post|
          page.should have_selector('p', text: "test")
        end
      end
    end
  end

end
