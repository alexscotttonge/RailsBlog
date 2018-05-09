require 'rails_helper'

RSpec.describe User, type: :model do

  it "user email can't be blank" do
    user = User.new(email: "")

    expect(user).to_not be_valid
  end

  it "user name can't be blank" do
    user = User.new(email: "email@example.com", name: "")

    expect(user).to_not be_valid
  end
end

RSpec.describe User, "secure_password" do
  it "has a secure password" do
    user = User.new(email: "email@example.com", name: "name")

    expect(user).to_not be_valid
  end
end
