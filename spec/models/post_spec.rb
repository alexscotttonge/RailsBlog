require 'rails_helper'

RSpec.describe Post, type: :model do
  it "updates Post model" do
    user = create :user
    user.posts.create

    expect(Post.count).to eq 1
  end

  it "user id should be present" do
    user = create :user
    post = user.posts.create

    expect(user.id).to eq post.id
  end
end
