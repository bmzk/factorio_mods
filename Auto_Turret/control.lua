require 'mod-gui'
require 'price'
f={id = 0,
id2 = 0,
money = 100,
start_tick = -1,
mag={
    id=1,
    cn = {"标准弹匣", "穿甲弹匣", "贫铀弹匣"},
    type = {"firearm-magazine", "piercing-rounds-magazine", "uranium-rounds-magazine"},
    price = {8, 38, 200}
    }

}

function f.get_label()
    if f.label2.caption == " " then
        f.money =  f.label.caption *1.0
    elseif f.label2.caption == "K" then
        f.money =  f.label.caption * 10^3
    elseif f.label2.caption == "M" then
        f.money =  f.label.caption * 10^6
    elseif f.label2.caption == "B" then
        f.money =  f.label.caption * 10^9
    end
end

function f.set_label()
    if f.money < 10^4 then
        f.label.caption = string.format("%0.0f", f.money/(10^0))
        f.label2.caption = " "
    elseif f.money < 10^7 then
        f.label.caption = string.format("%0.3f", f.money/(10^3))
        f.label2.caption = "K"
    elseif f.money < 10^10 then
        f.label.caption = string.format("%0.6f", f.money/(10^6))
        f.label2.caption = "M"
    else 
        f.label.caption = string.format("%0.9f", f.money/(10^9))
        f.label2.caption = "B"
    end
end

function f.create_gui(e)
    game.players[1].print("auto-turret  create_gui  tick= "..game.tick)
    if mod_gui.get_frame_flow(game.players[1]).myframe ==nil  then
        f.frame = mod_gui.get_frame_flow(game.players[1]).add{
            type="frame", name="myframe", caption = "数据面板", direction="vertical"}
        
        f.table = f.frame.add{type = "table",  name = "table", column_count = 3}
        f.table.add{type="label", caption="Money(K): ", style = "caption_label" }
        f.table.add{type="label", caption=100, name="label"}
        f.table.add{type="label", caption=" ",name = "label2"}
        ----------------------------------------------------------------
        f.table.add{type="label", caption="弹药箱子："}
        f.table.add{type="label", name = "label3"}
        f.table.add{type="label", caption="个"}
        ----------------------------------------------------------------
        f.table.add{type="label", caption="机枪炮塔："}
        f.table.add{type="label", name = "label4"}
        f.table.add{type="label", caption="个"}

        f.add_bt()
    end
    f.label = mod_gui.get_frame_flow(game.players[1]).myframe.table.label
    f.label2 = mod_gui.get_frame_flow(game.players[1]).myframe.table.label2
    f.label3 = mod_gui.get_frame_flow(game.players[1]).myframe.table.label3
    f.label4 = mod_gui.get_frame_flow(game.players[1]).myframe.table.label4
end
function f.add_bt()
    if (mod_gui.get_frame_flow(game.players[1]).myframe.table2 == nil) then
        f.frame = mod_gui.get_frame_flow(game.players[1]).myframe
        f.frame.add{type = "table",  name = "table2", column_count = 2}
        f.frame.table2.add{type="label", name = "bt_label", caption = f.mag.cn[f.mag.id] }
        f.frame.table2.add{type = "button", name = "bt1", caption = "切换弹药"}
    end
end
--if math.floor((game.tick+50) % t) ==0 then 
function f.tick_sub_1(event)
    --game.players[1].print("auto-turret  f.tick_sub_1  tick= "..(game.tick - f.start_tick))
    if f.start_tick < 0 then
        f.start_tick = game.tick
        --game.players[1].print("auto-turret  f.tick_sub_1  f.start_tick = "..f.start_tick)
    end
    if game.tick - f.start_tick > 10 then
        f.create_gui()
        script.on_event(defines.events.on_tick, f.tick_sub_2)
        -- game.print("auto-turret  f.tick_sub_2    "..f.start_tick)
    end
end

function f.tick_sub_2(event)
    if game.tick - f.start_tick > 100 then
        --game.print("mod:auto-turret  function:f.tick_sub_2  dis:start f.tick_sub_3    tick= "..game.tick)
        script.on_event(defines.events.on_tick,f.tick_sub_3)
    end
end

function f.tick_sub_3(event)
    f.get_label()
    --game.players[1].print("function f() is starting .......")
    --game.print("mod:auto-turret  function:f.tick_sub_3  dis:run f.tick_sub_3    tick= "..game.tick)
    ----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    local chests = game.surfaces["nauvis"].find_entities_filtered{ name = "magazine-chest" }
    f.id2 =f.id2 +1
    if f.id2 > #chests then 
        f.id2 = 1
    end
    if chests[f.id2] ==  nil then
        f.insert_magazine()
        return 1
    end
    local chest = chests[f.id2].get_output_inventory()
    for i=1,3,1 do
        n1 = chest.get_item_count(f.mag.type[i])
        if n1 >0 then
            f.money= f.money +  f.mag.price[i] * n1
            chest.remove({name=f.mag.type[i], count = n1 })
        end
        --game.print(tostring("remove mag".."i="..i.."  "..n1))

    end
    f.set_label()
    ---------------------------------------------------------------------------------
    f.insert_magazine()
    f.set_label()
    --------------------------------------
    f.label3.caption = #chests
    ---------------------------------------------------------------
    f.insert_shell()
    f.set_label()
end

function f.insert_magazine()
    --装填子弹
    local turrets = game.surfaces["nauvis"].find_entities_filtered{ name = "gun-turret" }
    f.id =f.id +1
    if f.id > #turrets then 
        f.id = 1
    end

    local turret = turrets[f.id]
    if turret == nil then
        return 0
    end
    --game.print(f.id..tostring(turret)..tostring(turret.get_output_inventory().is_empty())..game.tick)
    if turret.get_output_inventory().is_empty() then
        turret.insert({name=f.mag.type[f.mag.id], count=30})
        f.money= f.money - f.mag.price[f.mag.id] * 30
        f.money= f.money - math.ceil((turret.prototype.max_health-turret.health)*0.1)
        turret.health=turret.prototype.max_health
        f.set_label()
        if f.money < 0 then
            game.players[1].print("金钱不足    game.tick = "..game.tick)
        end
    end
    f.label4.caption = #turrets

end


function f.insert_shell()
    --装填子弹
    local artillery = game.surfaces["nauvis"].find_entities_filtered{ name = "artillery-turret" }

    --game.print(f.id..tostring(turret)..tostring(turret.get_output_inventory().is_empty())..game.tick)
    for k,v in pairs(artillery) do
        if v.get_output_inventory().is_empty() then
            v.insert({name="artillery-shell", count=10})
            f.money= f.money - p["artillery-shell"] * 10
            f.set_label()
            if f.money < 0 then
                game.players[1].print("金钱不足    game.tick = "..game.tick)
            end
        end
    end

end


script.on_event({defines.events.on_gui_click}, function(event)
    if(event.element.name == "myframe") then
        --f.add_bt()
        f.money=f.money+1000*1000
        game.players[1].print("测试用后门，money 增加 1000,000 ")
        f.set_label()
    elseif (event.element.name == "bt1") then
        f.mag.id=f.mag.id+1
        if f.mag.id>3 then
            f.mag.id = 1
        end
        mod_gui.get_frame_flow(game.players[1]).myframe.table2.bt_label.caption = f.mag.cn[f.mag.id]
    end

end)

script.on_event(defines.events.on_tick, f.tick_sub_1)

