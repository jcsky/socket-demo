# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_#{params[:chatroom_id]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    chatroom = Chatroom.find(data["chatroom_id"])
    message = Message.create(chatroom_id: chatroom.id, content: data["msg"])
    message_html = ApplicationController.renderer.render( :partial => "chatroom_messages/message", :locals => { message: message } )
    ActionCable.server.broadcast "chatroom_#{chatroom.id}", {
      message: message_html
    }
  end
end
