modalWindow = nil

function online()
end

function init()
  connect(g_game, { onGameStart = online,
                    onGameEnd   = offline })
				
  modalWindow = g_ui.displayUI('modal.otui')			
  g_logger.info("Please work")
  
  if g_game.isOnline() then
    online()
  end

end


function terminate()
  disconnect(g_game, { onGameStart = online,
                       onGameEnd   = offline })
  if modalWindow then
    modalWindow:destroy() 
  end
 
end

function offline()
  resetWindow()
end

function resetWindow()
  if modalWindow then
    modalWindow:hide()
  end
end

function actionButtonPressed()
  if modalWindow then
	local button = modalWindow:getChildById('actionButton')
	local buttonSize = button:getSize()

    -- Get the main window position and size
    local mainWindowSize = modalWindow:getSize()
    
    -- Calculate a random position within the main window bounds
    local randomX = math.random(mainWindowSize.width / 2, mainWindowSize.width)
    local randomY = math.random(0, mainWindowSize.height - buttonSize.height)
    
    -- Set the button's position to the random position
    button:setPosition({ x =  randomX, y = randomY })
  end
end





