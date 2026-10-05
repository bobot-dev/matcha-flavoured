# Apply Doom effect every 3s

execute if score @s adamant_armour matches 1 run return run function matcha:enchantment_effects/adamant_effects/doom/find_targets.macro {damage:3,range:12}
execute if score @s adamant_armour matches 2 run return run function matcha:enchantment_effects/adamant_effects/doom/find_targets.macro {damage:6,range:16}
execute if score @s adamant_armour matches 3 run return run function matcha:enchantment_effects/adamant_effects/doom/find_targets.macro {damage:9,range:20}
execute if score @s adamant_armour matches 4.. run return run function matcha:enchantment_effects/adamant_effects/doom/find_targets.macro {damage:16,range:28}
