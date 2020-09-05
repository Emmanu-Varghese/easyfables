class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable

   def liked?(story_id)
   		user_like = UserLike.where(:user_id => self.id).where(:story_id => story_id)
   		if user_like.blank?
   			return false
   		else
   			return true
   		end
   end
end
