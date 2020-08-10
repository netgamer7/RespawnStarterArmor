local function give_player_items(player, items) 
	for i, v in pairs(items) do
		player.insert{name = v[1], count = v[2]}
	end
end

script.on_event(defines.events.on_player_respawned, function(event)
  if settings.global["respawn-starter-armor"].value == false then
    do return end
  end

  local player = game.players[event.player_index]
  if player.character then
    player.character.clear_items_inside()
    local armor
    local armor_items
    local intermediates
    local production
    local logistics
    local car
  
    armor_items = {
      {"starter-armor", 1},
      {"starter-robot", 100}
    }
  
    armor = {
      {"fusion-reactor-equipment"},	
      {"exoskeleton-equipment"},
      {"exoskeleton-equipment"},		
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},
      {"personal-roboport-equipment"},	
      {"battery-equipment"},
      {"battery-equipment"},
      {"battery-equipment"},
      {"battery-equipment"},			
    }
  
    intermediates = {
      {"iron-plate", 592},
      {"copper-plate", 400},
      {"electronic-circuit", 400},
      {"iron-gear-wheel", 400}
    }
  
    production = {
      {"stone-furnace", 96},
      {"assembling-machine-1", 40},
      {"assembling-machine-2", 10},
      {"electric-mining-drill", 50},
      {"boiler", 10},
      {"steam-engine", 20},
      {"offshore-pump", 1}
    }
  
    logistics = {
      {"transport-belt", 1100},
      {"underground-belt", 100},
      {"splitter", 50},
      {"inserter", 200},
      {"long-handed-inserter", 50},
      {"steel-chest", 50},
      {"medium-electric-pole", 200},
      {"pipe-to-ground", 50},
      {"pipe", 200},
      {"small-lamp", 100}
    }
  
    car = {
      {"car", 1}
    }
  
    local player = game.players[event.player_index]
    
    if settings.global["respawn-starter-armor"].value then
      give_player_items(player, armor_items)
      local grid = player.get_inventory(defines.inventory.character_armor)[1].grid
      for  i, v in pairs(armor) do
        grid.put({name = v[1]})
      end	
    end
  
    if settings.global["respawn-starter-armor-intermediates"].value then
      give_player_items(player, intermediates)
    end
  
    if settings.global["respawn-starter-armor-production"].value then
      give_player_items(player, production)
    end
    if settings.global["respawn-starter-armor-logistics"].value then
      give_player_items(player, logistics)
    end
    if settings.global["respawn-starter-armor-car"].value then
      give_player_items(player, car)
    end
    if settings.global["respawn-starter-armor-research-toolbelt"].value then
      player.force.technologies["toolbelt"].researched = true
    end
  end
end)
