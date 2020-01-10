--data.raw.module["speed-module"].effect = { speed = {bonus = 2}, consumption = {bonus = 4}}

--data.raw.item["wood"].stack_size = 1000



local items={"wood","coal","stone","iron-ore","copper-ore",
"iron-plate","copper-plate","copper-cable","iron-gear-wheel",
"electronic-circuit","transport-belt","pipe","steel-plate",
}
for _,i in pairs(items) do
  data.raw.item[i].stack_size = 1000
end
