require 'rails_helper'

RSpec.describe User, type: :model do

  # From https://quickleft.com/blog/rails-tip-validating-users-with-has_secure_password/
  describe "Validations" do
  let(:user_required_fields) do
    { name: "Mary" }
  end

    context "on a new user" do

      let(:user){
      	User.new(user_required_fields)
      }

      let(:bob){
      	User.create(name: "Bob", password: "Pa55w0rD", password_confirmation: "Pa55w0rD")
      }

      it "should be valid with password and confirmation" do
        user.assign_attributes(password: "Pa55w0rd", password_confirmation: "Pa55w0rd")
        user.should be_valid
      end

      it "should not be valid with an empty password" do
        user.password = user.password_confirmation = ""
        user.should_not be_valid
      end

      it "should not be valid without a password" do
        user.assign_attributes password: nil, password_confirmation: nil
        user.should_not be_valid
      end

      it "should be not be valid with a short password" do
        user.assign_attributes password: 'short', password_confirmation: 'short'
        user.should_not be_valid
      end

      it "should not be valid with a confirmation mismatch" do
        user.assign_attributes password: 'short', password_confirmation: 'long'
        user.should_not be_valid
      end

      it "must have a unique name" do
      	user.assign_attributes(password: "Pa55w0rd", password_confirmation: "Pa55w0rd")
        user.assign_attributes(name: bob.name)
        user.should_not be_valid
      end
    end

    context "on an existing user" do
      let(:user) do
        u = User.create user_required_fields.merge(password: 'password', password_confirmation: 'password')
        User.find u.id
      end

      it "should be valid with no changes" do
        user.should be_valid
      end

      it "should be valid with a new (valid) password" do
        user.password = user.password_confirmation = "new password"
        user.should be_valid
      end

      it "should not be valid without password_confirmation" do
        user.password = "new password"
        user.password_confirmation = ""
        user.should_not be_valid
      end
    end
  end

end
