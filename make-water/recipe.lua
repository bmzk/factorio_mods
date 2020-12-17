data:extend(
{
--------------------------------
  {
    type = "recipe",
    name = "make-water",
	category = "crafting-with-fluid",
    energy_required = 1,
	subgroup = "fluid-recipes",
	ingredients =
    {
      {type="fluid", name="steam", amount=1}
    },
    results = 
	{
		{type="fluid", name="water", amount=10}
	},
  },
  {
    type = "recipe",
    name = "make-water-2",
	category = "crafting-with-fluid",
	subgroup = "fluid-recipes",
	ingredients =
    {
      {type="fluid", name="steam", amount=50}
    },
    results = 
	{
		{type="fluid", name="water", amount=1}
	},
  }

})