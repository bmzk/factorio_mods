require 'mod-gui'
t={}
t.init=false

function t.create_basegui()
    t.frame = mod_gui.get_frame_flow(game.players[1]).frame
    if type(t.frame) == "nil"   then
        t.frame = mod_gui.get_frame_flow(game.players[1]).add{
            type="frame",name="frame",caption="数据面板",direction="vertical"}
        t.table = f.frame.add{type = "table",  name = "table", column_count = 2}
        t.table.add{type="label", caption="Money(万): ", style = "caption_label" }
        t.table.add{type="label", caption=k,name="label"}
        game.players[1].print("basegui 创建面板 !  tick = "..game.tick)

    end
end


function t.get_table()
   return t.frame.table
end
function t.set_caption(labelname,text)
   local table=t.frame.table
   if type(labelname) ~= "nil" then 
      table[labelname].caption=text
   end
end
function t.get_is_init()
   return t.init
end




function t.on_init()
    if game.tick> 1 then
      t.create_basegui()
      remote.add_interface("fpc_gui",{
         get_is_init = t.get_is_init,
         get_table   = t.get_table ,
         set_caption = t.set_caption,
         create_basegui= t.create_basegui
      })
      script.on_event(defines.events.on_tick,  nil)
      game.players[1].print("载入 basegui mod 成功 !    tick = "..game.tick)
    end
    
end


--script.on_nth_tick(100, t.gameloadcheck())
--script.on_nth_tick(1000, t.on_init())
--script.on_event(defines.events.on_player_created,t.on_init)

script.on_event(defines.events.on_tick, t.on_init)
--script.on_init(t.on_init)
--script.on_event(defines.events.on_tick,  run)