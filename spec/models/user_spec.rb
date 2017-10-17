require 'rails_helper'

RSpec.describe User, type: :user do

  context "when the user is created" do

  let (:user) { User.new(email: "shapaek@gmail.com", password: "blabla")}

    it "has a email attribute" do
      expect(user.email).to eq("shapaek@gmail.com")
    end

    it "has a password attribute" do
      expect(user.password).to eq("blabla")
    end
  end

  context "when user information is missing" do

    it "is missing a email" do

      user = User.new(password: "blabla")
      user.save

      expect(User.all.length).to eq(0)
    end

    it "is missing a password" do

      user = User.new(email: "shapaek@gmail.com")
      user.save

      expect(User.all.length).to eq(0)
    end

    context "user validation" do

      describe User do
        it { should have_valid(:email).when("shapaek@gmail.com") }
        it { should_not have_valid(:email).when(nil, "", "shapaekgmail.com") }

        it { should have_valid(:password).when("shapaek") }
        it { should_not have_valid(:password).when(nil, "") }
      end
    end

  end
end
