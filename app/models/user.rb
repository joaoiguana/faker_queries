class User < ApplicationRecord
  has_many :posts

  def self.top_5_users
    User.joins(:posts)
        .select('users.*, COUNT(posts.id) as posts_count')
        .group('users.id')
        .order('posts_count DESC')
        .limit(5)
        .includes(:posts)
  end
end
