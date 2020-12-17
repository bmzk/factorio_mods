data:extend(
{
  {
    type = "recipe",
    name = "speed-module",
    ingredients =
    {
      {"copper-plate", 5},
      {"iron-plate", 5}
    },
    result = "speed-module"
  },

  {
    type = "recipe",
    name = "productivity-module",
    ingredients =
    {
      {"copper-plate", 5},
      {"iron-plate", 5}
    },
    result = "productivity-module"
  },
 {
    type = "module",
    name = "effectivity-module",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "module",
    category = "effectivity",
    tier = 1,
    order = "c[effectivity]-a[effectivity-module-1]",
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = 0.3},speed = {bonus = -0.15}},
    limitation = production
  }
}
)
