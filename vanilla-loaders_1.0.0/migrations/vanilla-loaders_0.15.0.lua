local function patch_loader_technology(technology, recipe)
	for k,force in pairs(game.forces) do
		if force.technologies[technology] then
			force.recipes[recipe].enabled = force.technologies[technology].researched
		end
	end
end
patch_loader_technology("logistics"      ,"loader"               )
patch_loader_technology("logistics-2"    ,"fast-loader"          )
patch_loader_technology("logistics-3"    ,"express-loader"       )
patch_loader_technology("bob-logistics-4","faster-loader"        )
patch_loader_technology("bob-logistics-5","extremely-fast-loader")
