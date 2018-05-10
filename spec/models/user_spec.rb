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

  it "has a secure password" do
    user = User.new(email: "email@example.com", name: "name")

    expect(user).to_not be_valid
  end

  it "user is saved correctly to the database" do
    User.create(email: "email@example.com", name: "name",
                    password: "letmein", password_confirmation: "letmein")

    expect(User.count).to eq 1
  end
end
