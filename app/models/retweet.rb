# == Schema Information
#
# Table name: retweets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  tweet_id   :integer          not null
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  
  after_create :create_tweet

  def create_tweet
    Tweet.create(
      user_id: self.user_id, 
      body: self.tweet.body,
      retweet: self
    )
  end
  
end
