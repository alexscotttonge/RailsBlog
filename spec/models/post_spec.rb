require 'rails_helper'

RSpec.describe Post, type: :model do
  it "post title should be present" do
    user = create :user
    post = user.posts.create(title: "")

    expect(post).to_not be_valid
  end

  it "updates Post model" do
    user = create :user
    user.posts.create(title: "My little pony")

    expect(Post.count).to eq 1
  end

  it "user id should be present" do
    user = create :user
    post = user.posts.create(title: "My little pony")

    expect(user.id).to eq post.id
  end
end
