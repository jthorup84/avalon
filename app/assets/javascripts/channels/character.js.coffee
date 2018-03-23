window.activateCharacterChannel = (character) ->

  App.cable.subscriptions.create { channel: "CharacterChannel", character: character.id },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log "character:#{character.id}", 'connected'

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log "character:#{character.id}", 'disconnected'

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log "character: #{character.id}", data

      console.log data.status
      switch data.status
        when "joined" then $("#character-list[data-game='#{character.game_id}']").append(data.characterHtml)
        when "kicked" then @_kick()

    _kick: ->
       alert "you were kicked out"
       document.location.href="/" #redirect home
