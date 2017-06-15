var re = /.rooms.\d+.talks/;
var ex = /\d+/;

if(re.test($(location).attr('pathname')) == true){
  var id =  $(location).attr('pathname').match(ex)[0]
    // console.log($(location).attr('pathname').match(ex)[0]);
    // var userid = $('#userid').text();
    // console.log(userid);
  App.room = App.cable.subscriptions.create({ channel: "RoomChannel",  room: "room_"+id},{
    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      // console.log(data['name']);
      var user = $('#userid').text();
      // console.log(user);
      if(data['name'] == user){
          $('#chat_message').append($('<div>').attr('class', 'l-talk-me').append($('<p>'+data['message']+'</p>').attr('class', 'brkword')));
      }else{
          $('#chat_message').append($('<div>').attr('class', 'l-talk-you').append($('<p>'+data['message']+'</p>').attr('class', 'brkword')));
      }
      $('#chat_message').animate({scrollTop: $('#chat_message')[0].scrollHeight}, 'normal');
      // alert(data['message']);

      //表示あぺんどはここに書く
    },

    speak: function(message) {
      // return this.perform('speak', {message: message});
      return this.perform('speak', {message: message, id: id});
      //ルームチャンネルにメッセージを送るやつ
    }
  });

  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event){
      if (event.keyCode === 13 && !(event.target.value == '')){
          App.room.speak(event.target.value);
          event.target.value = '';
          event.preventDefault();
      }
      $('#textbtn').on('click', function(){
          console.log('asdf');
          if(!(event.target.value == '')){
              App.room.speak(event.target.value);
              event.target.value = '';
              event.preventDefault();
          }
      })
  });
}
