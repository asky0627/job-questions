class Question < ActiveRecord::Base

  #association
  belongs_to :user
  has_many :answers


  #validation
  validates_presence_of :user_id, :title

end

