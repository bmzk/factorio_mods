local function patch_loader_item(item, beltname)
	if item then
		local baseitem = data.raw["item"][beltname]
		local name = item.name
		item.icon  = "__vanilla-loaders__/graphics/icons/"..name..".png"
		
		item.order = string.gsub(string.gsub(item.order,"^[a-z]","d"),"transport%-belt","loader")
	end
end
local function make_loader_item(name, beltname)
	if data.raw["item"][beltname] then
		local baseitem = data.raw["item"][beltname]
		local item = table.deepcopy(data.raw["item"]["loader"])
		item.name = name
		item.subgroup = baseitem.subgroup
		item.place_result = name
		item.order = baseitem.order
		patch_loader_item(item, beltname)
		data:extend({item})
	end
end

patch_loader_item(data.raw["item"]["loader"],         "transport-belt")
patch_loader_item(data.raw["item"]["fast-loader"],    "fast-transport-belt")
patch_loader_item(data.raw["item"]["express-loader"], "express-transport-belt")
make_loader_item("faster-loader",         "green-transport-belt")
make_loader_item("extremely-fast-loader", "purple-transport-belt")
