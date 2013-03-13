require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User")}

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 16 }
    it { should_not be_valid }
  end

  describe "when name format is valid" do
    it "should be valid" do
      names = ['A B', 'A.B', 'A. B', 'A B.', 'A', 'B']
      names.each do |valid_name|
        @user.name = valid_name
        @user.should be_valid
      end
    end
  end

  describe "when name format is invalid" do
    it "should not be valid" do
      names = %w[\\ ~ ! @ # $ % ^ & * ( ) _ - + = : ; ' < > ? / { } [ ] | ]
      names.each do |invalid_name|
        @user.name = invalid_name
        @user.should_not be_valid
      end
    end
  end

  describe "when name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end

    it { should_not be_valid }
  end


end
