require 'mod-gui'
local k=100.001
local mymoney=k



script.on_event({defines.events.on_gui_click}, function(event)
   if(event.element.name == "myframe") then
      mymoney=mymoney+1000*1000
      game.players[1].print("测试用后门，money 增加 1000,000 ")
      local inventory = game.players[1].get_main_inventory()
      local v=inventory.get_item_count("coin")
      if v ~=nil then
         if v~=0 then
            mymoney= mymoney +v
            inventory.remove({name="coin",count=v})
         end
      end
      local label=mod_gui.get_frame_flow(game.players[1]).myframe.table.label
      label.caption=string.format("%d", mymoney)
   end
end)

local function create_gui(e)
   if mod_gui.get_frame_flow(game.players[1]).myframe ==nil   then 
      local  myframe = mod_gui.get_frame_flow(game.players[1]).add{
            type="frame", name="myframe", caption = "金钱系统", direction="vertical"}
      local table = myframe.add{type="table", name="table", column_count=2}
      table.add{type="label", caption="Money : ", style="caption_label"}
      table.add{type="label", caption=k,name="label"}
   end 
end
script.on_event(defines.events.on_player_created, create_gui)


local function tick_sub()
   --game.players[1].print("function f() is starting .......")
   for _, surface in pairs(game.surfaces) do
      local turrets = surface.find_entities_filtered{ name = "gun-turret" }
      for _, turret in pairs(turrets) do
         if turret.get_output_inventory().is_empty() then
            turret.insert({name="firearm-magazine", count=10})
            mymoney= mymoney -40
         end
         mymoney= mymoney - (turret.prototype.max_health-turret.health)*0.1
         turret.health=turret.prototype.max_health
     end
   end
end


local t=100
local function on_tick(event)
   if math.floor((game.tick+50) % t) ==0 then 
      --game.players[1].print("auto-turret tick= "..game.tick)
      local label=mod_gui.get_frame_flow(game.players[1]).myframe.table.label
      mymoney=tonumber(label.caption)
      if mymoney>0 then
         tick_sub()
         --game.players[1].print("tick_sub() end")
      end
      label.caption=string.format("%d", mymoney)
   end
end
script.on_event(defines.events.on_tick,on_tick)