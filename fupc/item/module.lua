-- module -----------------------
-- 速度插件 ----
data.raw["module"]["speed-module"].effect = { speed = {bonus = 2}}
data.raw["recipe"]["speed-module"].enabled = true
data.raw["recipe"]["speed-module"].energy_required = nil
data.raw["recipe"]["speed-module"].ingredients = {{"iron-plate", 1}}

data.raw["module"]["speed-module-2"].effect = { productivity = {bonus = 2}}
data.raw["recipe"]["speed-module-2"].enabled = true
data.raw["recipe"]["speed-module-2"].energy_required = nil
data.raw["recipe"]["speed-module-2"].ingredients = {{"iron-plate", 1}}

data.raw["module"]["speed-module-3"].effect = { consumption = {bonus = 2}}
data.raw["recipe"]["speed-module-3"].enabled = true
data.raw["recipe"]["speed-module-3"].energy_required = nil
data.raw["recipe"]["speed-module-3"].ingredients = {{"iron-plate", 1}}

-- 产能插件 ----
data.raw["module"]["productivity-module"].limitation = {}
data.raw["module"]["productivity-module"].effect = { productivity = {bonus = 2}}
data.raw["recipe"]["productivity-module"].enabled = true
data.raw["recipe"]["productivity-module"].energy_required = nil
data.raw["recipe"]["productivity-module"].ingredients = { }
data.raw["recipe"]["productivity-module"].ingredients[1] = {"iron-plate", 1}


-- 节能插件 --
data.raw["module"]["effectivity-module"].effect = { pollution = {bonus = 5}}
data.raw["recipe"]["effectivity-module"].enabled = true
data.raw["recipe"]["effectivity-module"].energy_required = nil
data.raw["recipe"]["effectivity-module"].ingredients = { }
data.raw["recipe"]["effectivity-module"].ingredients[1] = {"iron-plate", 1}
