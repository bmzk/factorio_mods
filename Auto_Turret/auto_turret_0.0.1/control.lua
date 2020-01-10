require 'mod-gui'
local button_name = 'bt'
local mycoin=0
script.on_event({defines.events.on_gui_click}, function(event)
   if(event.element.name == button_name) then
      mycoin=mycoin+1000*1000
      game.players[1].print("增加 1000,000 COINS")
      local inventory = game.players[1].get_main_inventory()
      local v=inventory.get_item_count("coin")
      if v ~=nil then
         if v~=0 then
            mycoin= mycoin +v
            inventory.remove({name="coin",count=v})
         end
      end
   end
end)

local function create_gui(e)
   local player = game.players[1]
   mod_gui.get_button_flow(player).add{type = "button", name="bt", caption={"bt"}, style = mod_gui.button_style}
end
script.on_event(defines.events.on_player_created, create_gui)


local function f()
   --game.players[1].print("function f() is starting .......")
   for _, surface in pairs(game.surfaces) do
      local turrets = surface.find_entities_filtered{ name = "gun-turret" }
      for _, turret in pairs(turrets) do
         if turret.get_output_inventory().is_empty() then
            turret.insert({name="firearm-magazine", count=10})
            mycoin= mycoin -40
            mod_gui.get_button_flow(game.players[1]).bt1.caption = turret.health

         end
         mycoin= mycoin + turret.health - turret.prototype.max_health
         turret.health=turret.prototype.max_health
     end
   end
end

local nth=1
local t=200
local function on_tick(event)
      nth=nth+1
      if nth % t ==0 then 
         if mycoin>0 then
            f()
         end
         mod_gui.get_button_flow(game.players[1]).bt.caption = "COIN: "..string.format("%2d", mycoin)
     end
end
script.on_event(defines.events.on_tick,on_tick)