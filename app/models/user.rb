class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :answers


  has_many :follows_f, class_name: "Relation", foreign_key: :from_id
  has_many :followings, through: :follows_f, source: :target

  has_many :followers_f, class_name: "Relation", foreign_key: :target_id
  has_many :followers, through: :followers_f, source: :from






  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "50x50>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]


  def get_related_questions
    questions = []
    followings.each do |following|
      following.questions.each do |question|
        questions << question
      end
    end
    return questions
  end


  def follow(user)
    followings << user
  end
  
  def unfollow(user)
    followings.destroy(user)
  end
  
  def followed?(user)
    followings.include?(user)
  end
  
  def follower?(user)
  followers.include?(user)
  end

end



