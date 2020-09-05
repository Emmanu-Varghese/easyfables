# frozen_string_literal: true

class LikeReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com

  def toggle
    story = Story.find(element.dataset[:id])
    story.update(:like => (story.like+1))
    # if !c_user.nil?
    #   user_like = UserLike.where(:user_id => c_user.id).where(:story_id => story.id)
    #   if user_like.blank?
    #     UserLike.create(:user_id => c_user.id,:story_id => story.id)
    #     story.update(:like => (story.like+1))
    #   else
    #     user_like.destroy_all
    #     if story.like > 0
    #       story.update(:like => (story.like-1))
    #     end
    #   end
    # end
   
  end

end
