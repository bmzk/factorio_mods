
require("chest")
data.raw["ammo-turret"]["gun-turret"].max_health = 25000
data.raw["ammo-turret"]["gun-turret"].attack_parameters.range = 55
data.raw["recipe"]["gun-turret"].enabled = true
data.raw["recipe"]["gun-turret"].ingredients ={{"iron-plate",2}}
--激光炮塔
data.raw["electric-turret"]["laser-turret"].max_health = 25000
data.raw["electric-turret"]["laser-turret"].attack_parameters.range = 55
data.raw["electric-turret"]["laser-turret"].energy_source.buffer_capacity = "8001kJ"
data.raw["recipe"]["laser-turret"].enabled = true
data.raw["recipe"]["laser-turret"].ingredients ={{"iron-plate",2}}
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


