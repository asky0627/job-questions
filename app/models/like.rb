class Like < ActiveRecord::Base
  belongs_to :ansewr, counter_cache: :likes_count
  belongs_to :user
end