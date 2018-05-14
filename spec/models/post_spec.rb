require 'rails_helper'

RSpec.describe Post, "assocations" do
  it { is_expected.to belong_to :user }
end

RSpec.describe Post, "ordering of posts" do
  it "sorts blog posts by date with most recent posts first" do
    old_post = create(:post, created_at: 2.days.ago)
    recent_post = create(:post, created_at: 7.minutes.ago)

    expect(Post.first).to eq recent_post
  end
end

RSpec.describe Post, type: :model do
  it "post title should be present" do
    user = create :user
    post = user.posts.create(title: "")

    expect(post).to_not be_valid
  end

  it "post content should be present" do
    user = create :user
    post = user.posts.create(title: "My little pony", content: "")

    expect(post).to_not be_valid
  end

  it "updates Post model" do
    user = create :user
    user.posts.create(title: "My little pony", content: "Lovely mane")

    expect(Post.count).to eq 1
  end

  it "user id should be present" do
    user = create :user
    post = user.posts.create(title: "My little pony", content: "Lovely mane")

    expect(post.id).to eq user.id
  end
end

RSpec.describe Post, type: :model do
  it "posts belonging to a user can be deleted" do
    user = create :user
    post = user.posts.create

    post.delete

    expect(Post.count).to eq 0
  end
end
