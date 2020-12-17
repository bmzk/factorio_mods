local function patch_loader_technology(technology, recipe)
	if data.raw["technology"][technology] then
		table.insert(data.raw["technology"][technology].effects, {
			type="unlock-recipe",
			recipe=recipe
		})
	end
end
patch_loader_technology("logistics"      ,"loader"               )
patch_loader_technology("logistics-2"    ,"fast-loader"          )
patch_loader_technology("logistics-3"    ,"express-loader"       )
patch_loader_technology("bob-logistics-4","faster-loader"        )
patch_loader_technology("bob-logistics-5","extremely-fast-loader")
