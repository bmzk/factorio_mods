local function make_loader_recipe(name, beltname, lastloader)
	if data.raw["item"][beltname] then
		local recipe = table.deepcopy(data.raw["recipe"]["express-loader"])
		recipe.name = name
		recipe.ingredients = {
			{beltname, 5},
			{lastloader, 1}
		}
		recipe.result = name
		data:extend({recipe})
	end
end
make_loader_recipe("faster-loader",         "green-transport-belt",  "express-loader")
make_loader_recipe("extremely-fast-loader", "purple-transport-belt", "faster-loader" )
