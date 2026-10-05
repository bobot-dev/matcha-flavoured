# If there are no doom targets (entities with weakness and not wearing adamant), don't continue the function
$execute unless entity @e[distance=..$(range),predicate=matcha:effects/has_weakness,predicate=matcha:not_wearing_adamant] run return fail

# Since the function continued, there is at least one doom target, so play the associated sound
playsound minecraft:event.mob_effect.raid_omen hostile @a ~ ~ ~ 0.4 2

# Run apply_doom on all doom targets
$execute as @e[distance=..$(range),predicate=matcha:effects/has_weakness,predicate=matcha:not_wearing_adamant] run function matcha:enchantment_effects/adamant_effects/doom/apply.macro {damage:$(damage)}
