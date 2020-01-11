
data.raw["accumulator"]["accumulator"]["energy_source"].buffer_capacity="5000GJ"
data.raw["accumulator"]["accumulator"]["energy_source"].input_flow_limit = "300MW"
data.raw["accumulator"]["accumulator"]["energy_source"].output_flow_limit = "300MW"
--插件效果分享塔
data.raw["beacon"].beacon.supply_area_distance=5
data.raw["beacon"].beacon.module_specification.module_slots=8
data.raw["beacon"].beacon.distribution_effectivity=10
data.raw["beacon"].beacon.energy_usage = "5000kW"
--插件
data.raw.module["speed-module"].effect = { speed = {bonus = 2}, consumption = {bonus = 4}}
----电炉
data.raw["furnace"]["electric-furnace"].module_specification.module_slots=8

--装载机
if data.raw.recipe["loader"] ~= nil then
  data.raw.recipe["loader"].enabled = true
end
if data.raw.item["loader"] ~= nil then
  data.raw.item["loader"].flags = {}
end

--fluid-wagon