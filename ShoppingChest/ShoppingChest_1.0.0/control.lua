require 'mod-gui'
require("price")

local mymoney=0

local function f()
  --game.players[1].print("function f() is starting .......")
  for _, surface in pairs(game.surfaces) do
    local chests = surface.find_entities_filtered{ name = "shopping-chest" }
    for _, chest in pairs(chests) do
      -----------------------------------
      --获取箱子的request_slot,包含物体名称和数量,例如 request_slot={name="wood"，count=1}
      local request_slot=chest.get_request_slot(1) ---type=table
      if request_slot ~= nil then
        request_slot["count"]= 1
        chest.set_request_slot(request_slot,1)
        local stack_size=game.item_prototypes[request_slot["name"]].stack_size
        --获取箱子中的物品,并将物品全部卖出
        local items=chest.get_output_inventory().get_contents()
        local item_count=0
        for _name , _count in pairs(items) do
          mymoney= mymoney + _count * getprice(_name)
          --game.players[1].print("卖出 ".._name.."  ".._count)
          if _name== request_slot["name"] then
            item_count=_count
          end
        end
        chest.get_output_inventory().clear()

        if item_count > stack_size then
          mymoney= mymoney - getprice(request_slot["name"])* stack_size
          chest.get_output_inventory().insert(
                    {name=request_slot["name"], count=stack_size})
        elseif item_count > 0 then 
          chest.get_output_inventory().insert(
                    {name=request_slot["name"], count=item_count})
          mymoney= mymoney - getprice(request_slot["name"])* item_count
        end
        -----------------------------------------
        --买入需求物品，数量为其stack_size
        if mymoney >0 then
          if stack_size > item_count then 
            mymoney= mymoney - getprice(request_slot["name"])* (stack_size-item_count) * 2
            chest.get_output_inventory().insert(
                    {name=request_slot["name"], count=(stack_size-item_count)})
          end
        end
      else
        --获取箱子中的物品,并将物品全部卖出
        local items=chest.get_output_inventory().get_contents()
        for _name , _count in pairs(items) do
            mymoney= mymoney + _count * getprice(_name)
            --game.players[1].print("卖出 ".._name.."  ".._count)
        end
        chest.get_output_inventory().clear()
      end
    end
  end
end

local nth=1
local t=100
local function on_tick(event)
    nth=nth+1
    if nth % t ==0 then 
      f()
      mod_gui.get_button_flow(game.players[1]).bt1.caption = "Money: "..mymoney
      --game.players[1].print("nth")
    end
end
script.on_event(defines.events.on_tick,on_tick)
------------------------------------------------------------------
---money 按钮事件--------------------------------------------------

local function create_gui(event)
    --创建按钮
    local bt1=mod_gui.get_button_flow(game.players[1]).add{
        type = "button", name="bt1", caption={"Money: "}, style = mod_gui.button_style}
    --game.players[1].print("create_gui() ok")
    --game.players[1].print("button.name="..bt1.name)
end
script.on_event(defines.events.on_player_created, create_gui)
local function on_gui_click(event)
    --按钮事件
    --game.players[1].print("if will start")
    if(event.element.name == "bt1") then
        --f()
        --mymoney=mymoney+1
        --local bt = mod_gui.get_button_flow(game.players[1]).bt1
        --game.players[1].print("button.name = "..bt.name)
        mod_gui.get_button_flow(game.players[1]).bt1.caption = "Money: "..mymoney
        --game.players[1].print(bt.caption)
    end

    --game.players[1].print("f() ........")
end
script.on_event(defines.events.on_gui_click, on_gui_click)


