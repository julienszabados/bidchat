var weasel = weasel || {};
weasel.Application = (function()
{
  function Application() {
    this.start();
  }
  
  Application.prototype = 
  {
    start: function() {
      this.init_navigation();
      this.init_room_selection();
    },
    init_navigation: function(){
      var $navItems = $('.sidebar-navigation li');
      
      $navItems.on('click', function(){
        var $navItem = $(this);
        
        $navItems.filter(function(){
          return $(this).hasClass('selected')
        }).removeClass('selected');
        
        $navItem.addClass('selected');
        
        $('.sidebar-content .tab').hide().filter(function(){
          return $(this).attr('id') == $navItem.data('tab')
        }).show();
      });
    },
    init_room_selection: function(){
      var $sidebar = $('.sidebar-left .sidebar-content');
      
      $sidebar.on('click', '.item', function(){
        var $roomLink = $(this);
        
        $sidebar.find('.item.selected').removeClass('selected');
        $roomLink.addClass('selected');
        
        $('.chat-room-container .room.displayed').removeClass('displayed');
        $('.chat-room-container').find('.room[data-room='+$roomLink.data('room-id')+']').addClass('displayed');
      });
    }
  }
  
  return Application;
})();