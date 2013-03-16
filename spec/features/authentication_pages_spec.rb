require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "signin page" do
    before { visit jinqu_path }

    it { should have_selector('h1', text: 'Sign in') }
  end

  describe "signin" do
    before { visit jinqu_path }

    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should_not have_link('New Post') }
    end

    describe "with valid information" do
      let(:user) { User.create(name: "t", password: "t") }
      before do
        fill_in "Name", with: user.name
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('New Post') }

      describe "then signout" do
        before { click_link "Sign Out" }
        it { should_not have_link('New Post') }
      end
    end
  end

end
