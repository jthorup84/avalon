class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(object, action)
    send(action, object)
  end

end
