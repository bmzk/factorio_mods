local png ="__auto_turret__/icons/magazine.png"
local png2="__auto_turret__/icons/magazine2.png"
local myitem="magazine-chest"
data:extend({
    {
        type = "item",
        name = myitem,
        icon = png,
        icon_size = 32,
        subgroup = "storage",
        order = "a[items]-c["..myitem.."]",
        place_result = myitem,
        stack_size = 10
    },
    -----------------------
    {
        type = "recipe",
        name = myitem,
        ingredients = {{"iron-plate", 1}},
        result = myitem,
    },
    ----------------------------
    {
        type = "container",
        name = myitem,
        icon = png,
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.2, result = myitem,},
        max_health = 1000,
        corpse = "steel-chest-remnants",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        resistances =
        {
            {
                type = "fire",
                percent = 90
            }
        },
        collision_box = {{-1.85, -1.85}, {1.85, 1.85}},
        selection_box = {{-2, -2}, {2, 2}},
        fast_replaceable_group = "container",
        inventory_size = 10,
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        picture =
        {
            layers =
            {
                {
                    filename = png2,
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    shift = util.by_pixel(0, 0),
                }
            }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    }
})