
-- require("prototypes.item.module")
data.raw["ammo-turret"]["gun-turret"].max_health =5000
data.raw["ammo-turret"]["gun-turret"]["attack_parameters"].range=55
data.raw["accumulator"]["accumulator"]["energy_source"].buffer_capacity="5000GJ"
data.raw["accumulator"]["accumulator"]["energy_source"].input_flow_limit = "300MW"
data.raw["accumulator"]["accumulator"]["energy_source"].output_flow_limit = "300MW"
--data.raw["ammo-turret"]["gun-turret"]["healing_per_tick"]=1

data.raw.item["coin"].flags={}
data:extend(
{
  {
    type = "recipe",
    name = "coin",
    ingredients =
    {
      {"copper-plate", 1},
      {"iron-plate", 1 }
    },
    result = "coin"
  }
})