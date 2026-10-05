# run by advancement whenever a player sleeps in a bed
tag @s add is_sleeping

advancement revoke @s only matcha:mechanics/slept_in_bed

function matcha:mechanics/sleeping/calculate_sleep_duration

# add sleep check so that second or next players are not
# instantly considered "awake"
scoreboard players set @s sleepTimerScore -1

# needs to be scheduled because it relies on is_sleeping tag and
# apparently the tag command takes a tick to apply
schedule function matcha:mechanics/sleeping/calculate_sleep_rate 1t

# prevent "No amount of rest can pass this night" text
title @s actionbar ""

# display "n/n players sleeping" text in action bar
# 2 tick delay to ensure it runs after calculate_sleep_rate
schedule function matcha:mechanics/sleeping/notify_sleeping_players 2t
