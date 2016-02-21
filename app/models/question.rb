class Question < ActiveRecord::Base

  #association
  belongs_to :user



  #validation
  validates_presence_of :user_id, :text

end

