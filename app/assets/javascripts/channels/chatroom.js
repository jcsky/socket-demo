App.chatroom = App.cable.subscriptions.create({
  channel: "ChatroomChannel",
  chatroom_id: $("#room").data('chatroom-id')
}, {
  connected: function() {console.log('connected')},
  disconnected: function() {console.log('disconnected')},

  speak: function(content){
    this.perform("speak", { chatroom_id: content.chatroom_id, msg: content.msg } );
    $("#content-input").val("");
    console.log("send message: " + content.msg);
  },

  received: function(data) {
    console.log("I got message~!");
    var active_chatroom;
    messages = $("#messages");
    messages.append(data.message);
  }
});
