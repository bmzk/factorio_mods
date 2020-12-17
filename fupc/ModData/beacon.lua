--插件效果分享塔--
data:extend(
{
 --合成原料--
  {
    type = "recipe",
    name = "beacon",
	icon_size = 32,
    ingredients =
    {
       {"copper-plate", 5},
       {"iron-plate", 5}
    },
    result = "beacon"
  },
  --属性--
   {
    type = "beacon",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
	icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "beacon"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    allowed_effects = {"consumption", "speed", "pollution","productivity"},
    base_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-base.png",
      width = 116,
      height = 93,
      shift = { 0.34375, 0.046875}
    },
    animation =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna.png",
      width = 54,
      height = 50,
      line_length = 8,
      frame_count = 32,
      shift = { -0.03125, -1.71875},
      animation_speed = 0.5
    },
    animation_shadow =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna-shadow.png",
      width = 63,
      height = 49,
      line_length = 8,
      frame_count = 32,
      shift = { 3.140625, 0.484375},
      animation_speed = 0.5
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      width = 10,
      height = 10
    },
    supply_area_distance = 7,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_usage = "480kW",
    distribution_effectivity = 5,
    module_specification =
    {
      module_slots = 9,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    }
  }
}
)
