require 'rails_helper'

RSpec.describe User, "assocations" do
  it { is_expected.to have_many :posts }
end

RSpec.describe User, "validations" do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :name }
end

RSpec.describe User, "secure password" do
  it { is_expected.to have_secure_password }
end

RSpec.describe User, type: :model do
  it "user is saved correctly to the database" do
    create :user

    expect(User.count).to eq 1
  end
end

RSpec.describe User, "deleting users" do
  context "when a user is deleted" do
    it "deletes the blog posts associated with the user" do
      user = create :user
      user.posts.create(title: "Lovely jubbly", content: "Plates of meat")

      user.destroy

      expect(Post.count).to eq 0
    end
  end
end
