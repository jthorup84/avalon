window.activateGameCharactersChannel = (game) ->

  App.cable.subscriptions.create { channel: "GameCharactersChannel", game: game.id },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log "game:#{game.id}-characters", 'connected'

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log "game:#{game.id}-characters", 'disconnected'

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log "game: #{game.id}", data
      switch data.status
        when "left" then $("#character-list li[data-character='#{data.character.id}']").remove()
