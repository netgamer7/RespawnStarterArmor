local myGrid
local myEquipment
local MyBotItem
local myBot

myGrid = util.table.deepcopy(data.raw["equipment-grid"]["small-equipment-grid"])
myGrid.name = "starter-armor-grid"
myGrid.width = 10
myGrid.height = 8
data:extend({myGrid})

myEquipment = util.table.deepcopy(data.raw["armor"]["modular-armor"])
myEquipment.name = "starter-armor"
myEquipment.equipment_grid = "starter-armor-grid"
myEquipment.inventory_size_bonus = 20
myEquipment.resistances = {}
data:extend({myEquipment})

myBotItem = util.table.deepcopy(data.raw["item"]["construction-robot"])
myBotItem.name = "starter-robot"
myBotItem.place_result = "starter-robot"
data:extend({myBotItem})

myBot = util.table.deepcopy(data.raw["construction-robot"]["construction-robot"])
myBot.name = "starter-robot"
myBot.energy_per_move = "0kJ"
myBot.energy_per_tick = "0kJ"
myBot.speed = 0.4
myBot.minable = {mining_time = 10, result = "starter-robot"}
data:extend({myBot})