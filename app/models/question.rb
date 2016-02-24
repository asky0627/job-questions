class Question < ActiveRecord::Base

  #association
  belongs_to :user
  has_many :answers
  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end



  #validation
  #validates :title, presence: true

  def self.get_related_questions(current_user)
    questions = []
    current_user.followings.each do |following|
      following.questions.each do |question|
        questions << question
      end
    end

    return questions

    # rails c で書いた記述
    # current_user.each.....
  end



# @questions = Question.get_related_questions(current_user) これはcontroller

