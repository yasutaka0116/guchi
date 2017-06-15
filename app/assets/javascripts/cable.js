// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});
  // var re = /.rooms.\d+.talks/;
  // if(re.test($(location).attr('pathname')) == true){
    App.cable = ActionCable.createConsumer();
  // }
  // console.log(params);
  // App.cable = ActionCable.createConsumer();

}).call(this);
