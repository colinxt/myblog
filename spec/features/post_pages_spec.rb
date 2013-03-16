require 'spec_helper'

describe "PostPages" do

  subject {page}

  let(:user) { User.create(name: "t", password: "t") }
  before { sign_in user}

  describe "post creation" do
    before { visit root_path }

    describe "with invalid information" do
      it "should not create a post" do
        expect { click_button "Post" }.not_to change(Post, :count)
      end
    end

    describe "with valid information" do
      before { fill_in 'post_content', with: "testesteste"}
      it "should create a post" do
        expect { click_button "Post" }.to change(Post, :count).by(1)
      end
    end
  end
end
