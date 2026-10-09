# Debug
#effect give @s minecraft:glowing 1

# Make a sound
execute at @s run playsound minecraft:entity.villager.ambient neutral @a ~ ~ ~ 1 0.65

# Make the villager Unemployed
data merge entity @s {LastRestock:0,Xp:0,VillagerData:{level:1,profession:"minecraft:none"},Brain:{memories:{"minecraft:job_site":null}}}

# Reset their favourite food trade
tag @s remove foodChecked