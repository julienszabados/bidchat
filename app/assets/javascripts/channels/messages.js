App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function(){
    var self = this;
    $(document).on('keypress', '#message', function(e){
      if(e.keyCode == 13) {
        self.speak($(this).val());
        
        $(this).val('');
        e.preventDefault();
      }
    });
  },
  disconnected: function(){
   
  },
  received: function(data){
    var $messages = $('#messages');
    $messages.append(data.message);      
    $messages[0].scrollTop = $messages[0].scrollHeight
  },
  speak: function(message) {
    this.perform('speak', {message: message})
  }
});