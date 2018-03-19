class CharacterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "character-#{params['character']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
