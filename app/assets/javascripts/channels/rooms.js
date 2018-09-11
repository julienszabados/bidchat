$.when($.ready).then(function() {
  
  $('*[data-room]').each(function(){
    initRoom($(this));
  });
  
});

function initRoom($room) {
  App.cable.subscriptions.create({channel: "RoomsChannel", room_id: $room.data('room')}, {
    connected: function(){
      var self = this;
      
      $room.addClass('connected');
      
      $room.on('keypress', '.room-form input', function(e){
        if(e.keyCode == 13) {
          self.speak($(this).val());
          
          $(this).val('');
          e.preventDefault();
        }
      });
      
      $room.find('.message').transition('fade up');
    },
    disconnected: function(){
     
    },
    received: function(data){
      this.appendMessage(data);
    },
    speak: function(message) {
      this.perform('speak', {message: message})
    },
    appendMessage: function(data) {
      var $feed = $room.find('.room-feed'),
          $scrolledContainer;
          
      $feed.append(data.message).find('.message').last().transition('fade up');
      
      if($feed.hasClass('room-scrolled-container')) {
        $scrolledContainer = $feed;
      } else {
        $scrolledContainer = $feed.parents('.room-scrolled-container');
      }
      $scrolledContainer[0].scrollTop = $scrolledContainer[0].scrollHeight    
    }
  });

}