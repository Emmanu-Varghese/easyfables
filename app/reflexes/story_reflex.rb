# frozen_string_literal: true

class StoryReflex < ApplicationReflex
  delegate :current_user, to: :connection
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

  def proceed
    story = Story.find(element.dataset[:id])
    if !current_user.nil? and current_user.has_role?(:admin)
      story.update(:status => story.next_status)
    end
  end

  def need_correction
    story = Story.find(element.dataset[:id])
    if !current_user.nil? and current_user.has_role?(:admin)
      story.update(:status => "Rejected")
    end
  end

end
