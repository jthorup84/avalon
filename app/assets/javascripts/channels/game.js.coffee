window.activateGameChannel = (game) ->

  App.cable.subscriptions.create { channel: "GameChannel", game: game.id },
    _previous_active_state: null

    connected: ->
      # Called when the subscription is ready for use on the server
      console.log("game:#{game.id}", 'connected')
      @_previous_active_state = game.active

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log("game:#{game.id}", 'disconnected')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      switch data.status
        when "updated" then @_update data

    _update: (data) ->
      if data.game.active != @_previous_active_state
        document.location.reload()
      else
        document.getElementById("game-bad-number").innerHTML = data.game.bad_number
        document.getElementById("game-good-chars").innerHTML = data.dynamic.good_chars
        document.getElementById("game-bad-chars").innerHTML = data.dynamic.bad_chars
        document.getElementById("game-start").innerHTML = data.dynamic.start

      # Update previous active state
      @_previous_active_state = data.game.active

