require 'spec_helper'

describe "PostPages" do

  subject {page}

  let(:user) { User.create(name: "t", password: "t") }
  before { sign_in user}

  describe "post creation" do
    before { visit new_post_path }

    describe "with invalid information" do
      it "should not create a post" do
        expect { click_button "Post" }.not_to change(Post, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "post_title", with: "testesteste"
        fill_in "post_content", with: "testesteste"
        select "Public", from: "post_public"
      end
      it "should create a post" do
        expect { click_button "Post" }.to change(Post, :count).by(1)
      end
    end
  end

  # describe "post edit" do
  #   let!(@a_post) { Post.create(title: "fdf", content: "qqq", public: "true") }
  #   visit edit_post_path(@a_post)

  #   it { should have_selector('input', value: "fdf") }
  #   it { should have_selector('textarea', test: "qqq") }
  #   it { should have_selector('option', selected: "selected", text: "Public") }
  # end

  # describe "post deletion" do
  #   let!(:post) { Post.create(title: "fdf", content: "qqq", public: "true") }
  #   visit post_path(post)
  #   expect { click_link "Delete Post" }.to change(Post, :count).by(-1)
  # end
end
