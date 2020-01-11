local png="__ShoppingChest__/icons/shopping-chest.png"
local myitem="shopping-chest"
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
        type = "logistic-container",
        name = myitem,
        icon = png,
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.2, result = myitem,},
        max_health = 350,
        corpse = "steel-chest-remnants",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        opened_duration = logistic_chest_opened_duration,
        resistances =
        {
            {
                type = "fire",
                percent = 90
            }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        fast_replaceable_group = "container",
        inventory_size = 60,
        --filter_count = 3,
        logistic_mode = "requester",--type没有设置
        logistic_slots_count = 1,
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        picture =
        {
            layers =
            {
                {
                    filename = png,
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = util.by_pixel(0, -0.5),
                }
            }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    }
})