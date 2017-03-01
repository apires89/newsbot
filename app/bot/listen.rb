require "facebook/messenger"

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|

  brain = Brain.new
  brain.set_message(message)
  brain.start_typing
  brain.create_log
  brain.process_message
  brain.stop_typing

end

Bot.on :postback do |postback|

  brain = Brain.new
  brain.set_postback(postback)
  brain.start_typing
  brain.create_log
  brain.process_postback
  brain.stop_typing


end

Facebook::Messenger::Thread.set(
  setting_type: "call_to_actions",
  thread_state: "new_thread",
  call_to_actions:[
    {
    payload: "new_thread"
    }
  ]
    )

