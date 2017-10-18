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

  end

  context "user validation" do

    describe User do
      it { should have_valid(:email).when("shapaek@gmail.com") }
      it { should_not have_valid(:email).when(nil, "", "shapaekgmail.com") }

      it { should have_valid(:password).when("shapaek") }
      it { should_not have_valid(:password).when(nil, "") }
    end
  end

  context "user updates profile" do
    it "has an updated password" do
      user = User.create(id: 1, email: "shapaek@gmail.com", password: "blabla")
      User.update(user.id, email: "cbrennan31@gmail.com", password: "blabla2")

      new_user = User.find(user.id)
      expect(new_user.email).to eq("cbrennan31@gmail.com")
      expect(new_user.encrypted_password).not_to eq(user.encrypted_password)
    end
  end

  context "user deletes profile" do
    it "no longer exists" do
      user = User.create(email: "shapaek@gmail.com", password: "blabla")
      user.delete
      expect(User.all.length).to eq(0)
    end
  end
end
