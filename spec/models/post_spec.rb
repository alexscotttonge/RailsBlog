require 'rails_helper'

RSpec.describe Post, "assocations" do
  it { is_expected.to belong_to :user }
end

RSpec.describe Post, "default ordering of posts" do
  it "sorts blog posts by date with most recent posts first" do
    old_post = create(:post, created_at: 2.days.ago)
    recent_post = create(:post, created_at: 7.minutes.ago)

    expect(Post.draft.first).to eq recent_post
  end
end

RSpec.describe Post, ".published_on" do
  it "sorts by order of published date" do
    post_one = create(:post, created_at: 1.day.ago, published_on: 15.minutes.ago)
    post_two = create(:post, created_at: 2.days.ago, published_on: 10.minutes.ago)
    post_three = create(:post, created_at: 3.days.ago, published_on: 5.minutes.ago)

    expect(Post.published_on.first).to eq post_three
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
    post = user.posts.create

    expect(post.user_id).to eq user.id
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

RSpec.describe Post, ".published" do
  it "saves a published post" do
    create :post, title: "xColor rocks", published: true

    published_posts = Post.published

    expect(published_posts.pluck(:title)).to eq ["xColor rocks"]
  end
end

RSpec.describe Post, ".published" do
  it "saves a post as a draft by default" do
    user = create :user
    post = user.posts.create

    expect(post.published).to eq false
  end
end

RSpec.describe Post, "uploading a file" do
  it "saves an uploaded file to Active Storage" do
    user = create :user
    post = user.posts.create(title: "My little pony", content: "Lovely mane")

    saved_post = post.uploads.attach(io: File.open(Rails.root.join("spec", "support", "rails.png")), filename: 'rails.png', content_type: 'image/png')

    expect(saved_post[0]).to be_an_instance_of ActiveStorage::Attachment
  end
end
