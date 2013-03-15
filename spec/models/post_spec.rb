require 'spec_helper'

describe Post do
  before do
    @post = Post.new(title: "Im title", content: "testtesttest", public: true)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:public) }

  describe "when title is not present" do
    before { @post.title = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @post.content = nil }
    it { should_not be_valid }
  end

  describe "when public is not present" do
    before { @post.public = nil }
    it { should_not be_valid }
  end

  describe "post order" do
    let!(:older_post) do
      FactoryGirl.create(:post, created_at: 1.day.ago)
    end
    let!(:newer_post) do
      FactoryGirl.create(:post, created_at: 1.hour.ago)
    end

    it "should have the right order" do
      Post.all.should == [newer_post, older_post]
    end
  end
end
