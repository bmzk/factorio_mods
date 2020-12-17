local function patch_loader_entity(loader)
	if loader then
		local name = loader.name
		loader.icon                                   = "__vanilla-loaders__/graphics/icons/"..name..".png"
		loader.structure.direction_in.sheet.filename  = "__vanilla-loaders__/graphics/entity/loader/"..name.."-structure.png"
		loader.structure.direction_out.sheet.filename = "__vanilla-loaders__/graphics/entity/loader/"..name.."-structure.png"
		loader.structure.direction_in.sheet.width     = 96
		loader.structure.direction_out.sheet.width    = 96
		loader.structure.direction_in.sheet.height    = 64
		loader.structure.direction_out.sheet.height   = 64
		loader.structure.direction_in.sheet.y         = 0
		loader.structure.direction_out.sheet.y        = 64
	end
end
local function make_loader_entity(name, beltname)
	if data.raw["transport-belt"][beltname] then
		local loader = table.deepcopy(data.raw["loader"]["loader"])
		local basebelt = data.raw["transport-belt"][beltname]
		loader.name            = name
		loader.icon            = "__vanilla-loaders__/graphics/icons/"..name..".png"
		loader.minable.result  = name
		loader.belt_horizontal = basebelt.belt_horizontal
		loader.belt_vertical   = basebelt.belt_vertical
		loader.ending_top      = basebelt.ending_top
		loader.ending_bottom   = basebelt.ending_bottom
		loader.ending_side     = basebelt.ending_side
		loader.starting_top    = basebelt.starting_top
		loader.starting_bottom = basebelt.starting_bottom
		loader.starting_side   = basebelt.starting_side
		loader.speed           = basebelt.speed
		patch_loader_entity(loader)
		data:extend({loader})
	end
end

patch_loader_entity(data.raw["loader"]["loader"])
patch_loader_entity(data.raw["loader"]["fast-loader"])
patch_loader_entity(data.raw["loader"]["express-loader"])
make_loader_entity("faster-loader",         "green-transport-belt")
make_loader_entity("extremely-fast-loader", "purple-transport-belt")
