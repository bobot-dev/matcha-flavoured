# Since this runs immediately for every newly joined player, we don't need to use an advancement to trigger "on_first_load" functions, we just run them here.
# Set up scoreboard scores
function matcha:setup/scoreboard/player_setup

# For a new version, we wipe their recipe unlock advancements so they can learn new things that were added or tweaked (or bugged)
advancement revoke @s from minecraft:recipes/root

# Revoke Mechanics advancements which were not removed properly in previous versions
advancement revoke @s only matcha:mechanics/heart_container_obtained

# Maybe unnecessary? but if they have this they won't be able to sleep so just in case
advancement revoke @s only matcha:mechanics/slept_in_bed

# As only players with a version number below the current version are made to run this function, we can set player's version number to current version
scoreboard players operation @s version_number = current_version version_number

# Announce that a player has been updated
tellraw @a [{"text":"[!]","bold":true,"color":"green"},{"text":": ","color":"green"},{"translate":"log.kleispack.player_updated","color":"gray"}]
