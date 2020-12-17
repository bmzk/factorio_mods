-- 蓄电器 -------
data.raw["accumulator"]["accumulator"].energy_source = { 
    type = "electric", 
    buffer_capacity = "10GJ",
    usage_priority = "tertiary",
    input_flow_limit = "50MW",
    output_flow_limit = "50MW"
}
data.raw["recipe"]["accumulator"].enabled = true
data.raw["recipe"]["accumulator"].energy_required = nil
data.raw["recipe"]["accumulator"].ingredients = {{"iron-plate", 1}}

-- 插件效果分享塔 --
-- 影响距离
data.raw["beacon"]["beacon"].supply_area_distance = 7
-- 耗能
data.raw["beacon"]["beacon"].energy_usage = "480kW" 
-- 倍数
data.raw["beacon"]["beacon"].distribution_effectivity = 5
-- 插件槽数
data.raw["beacon"]["beacon"].module_specification.module_slots = 12

data.raw["recipe"]["beacon"].energy_required = nil
data.raw["recipe"]["beacon"].enabled = false
data.raw["recipe"]["beacon"].ingredients = { }
data.raw["recipe"]["beacon"].ingredients[1] = {"iron-plate", 1}

-- 电炉 -----
data.raw["recipe"]["electric-furnace"].energy_required = nil
data.raw["recipe"]["electric-furnace"].enabled = false
data.raw["recipe"]["electric-furnace"].ingredients = { }
data.raw["recipe"]["electric-furnace"].ingredients[1] = {"iron-plate", 5}
data.raw["furnace"]["electric-furnace"].module_specification.module_slots = 8

-- 组装机 --------
data.raw["assembling-machine"]["assembling-machine-3"].module_specification.module_slots = 8