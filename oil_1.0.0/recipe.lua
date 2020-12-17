data:extend(
{
  ---煤炭液化-----------
  {
    type = "recipe",
    name = "coal-liquefaction",
    category = "oil-processing",
    ingredients =
    {
      {type="item", name="coal", amount=10},
      {type="fluid", name="steam", amount=50}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=10},
      {type="fluid", name="light-oil", amount=15},
      {type="fluid", name="petroleum-gas", amount=20}
    },
    icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },
  --硫酸------------------------
  {
    type = "recipe",
    name = "sulfuric-acid",
    category = "chemistry",
    ingredients =
    {
      {"coal", 5},

    },
    results=
    {
      {type="fluid", name="sulfuric-acid", amount=5}
    },
    subgroup = "fluid-recipes",
  },
  --塑料-------------
  {
    type = "recipe",
    name = "plastic-bar",
    ingredients =
    {
      {"coal", 2}
    },
    results=
    {
      {type="item", name="plastic-bar", amount=1}
    }
  },
  --炸药-------------------------
  {
    type = "recipe",
    name = "explosives",
    ingredients ={
        {"coal", 1}
      },
    result= "explosives",
    result_count = 1
    },
  --电池-------------------------
  {
    type = "recipe",
    name = "battery",
    ingredients =
    {
        {"iron-plate", 1},
        {"copper-plate", 1}
    },
    result= "battery"
    },
}
)
