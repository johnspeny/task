spellWindow = nil

function online()
end

function init()
  connect(g_game, { onGameStart = online,
                    onGameEnd   = offline })
					

  spellWindow = g_ui.displayUI('spells.otui')
  
  g_logger.info("Hi")
  
  if g_game.isOnline() then
    online()
  end

end


function terminate()
  disconnect(g_game, { onGameStart = online,
                       onGameEnd   = offline })
  spellWindow:destroy() 
end

function offline()
  resetWindow()
end

function resetWindow()
  spellWindow:hide()
end