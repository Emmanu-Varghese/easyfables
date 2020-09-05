$(document).on('turbolinks:load', function () {
    App.story = App.cable.subscriptions.create("StoryChannel", {
      connected: function() {
        // Called when the subscription is ready for use on the server
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
      },

      received: function(data) {
        $("#story-"+data['message'][0]+"-like").html(data['message'][1]);
        // Called when there's incoming data on the websocket for this channel

      },
      speak: function() {
        return this.perform('speak');
      }
    });
});
