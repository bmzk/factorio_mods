require 'mod-gui'
require("price")
local k=100.001
local mymoney=k
local function refresh()
  local  label = mod_gui.get_frame_flow(game.players[1]).myframe.table.label
  label.caption=string.format("%d", mymoney)
end

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
local t=100
local function on_tick(event)
    if math.floor(game.tick % t) ==0 then 
      --game.players[1].print("shoppingchest tick= "..game.tick)
      local  label = mod_gui.get_frame_flow(game.players[1]).myframe.table.label
      mymoney=tonumber(label.caption)
      f()
      label.caption=string.format("%d", mymoney)
      --game.players[1].print("nth")
    end
end
script.on_event(defines.events.on_tick,on_tick)
------------------------------------------------------------------
local function create_gui(event)
    --创建gui
    if mod_gui.get_frame_flow(game.players[1]).myframe ==nil  then 
      local  myframe = mod_gui.get_frame_flow(game.players[1]).add{
            type="frame", name="myframe", caption = "金钱系统", direction="vertical"}
      local table = myframe.add{type="table", name="table", column_count=2}
      table.add{type="label", caption="Money : ", style="caption_label"}
      table.add{type="label", caption=k,name="label"}
   end
end
script.on_event(defines.events.on_player_created, create_gui)
