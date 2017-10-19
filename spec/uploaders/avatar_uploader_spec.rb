require 'rails_helper'

RSpec.describe AvatarUploader do 
  context "user has AvatarUploader" do
    let (:user) { User.new(email: "example@gmail.com", password: "blabla")}
    let (:uploader) { user.avatar }
      
    it "has a user with attributes" do
      expect(uploader.model).to be_a(User)
      expect(uploader.model.email).to eq("example@gmail.com")
      expect(uploader.model.password).to eq("blabla")
      expect(uploader.mounted_as).to eq(:avatar)
    end
  end
end