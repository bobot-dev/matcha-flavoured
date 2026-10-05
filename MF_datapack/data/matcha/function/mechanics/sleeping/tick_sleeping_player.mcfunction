# this function runs every tick for all players with the "is_sleeping" tag

# update sleepDuration
scoreboard players operation @s sleepDuration -= sleep_rate sleepTimerScore

# wake player if they've slept their whole sleepDuration
execute if score @s sleepDuration matches ..0 \
        run function matcha:mechanics/sleeping/wake_sleeping_player

# if the player just entered a bed, exit and return to normal loop.
# this is because when another player is already sleeping,
# the newly asleep one does not get SleepTimer nbt before this 
# function runs, so they are instantly considered awake.
execute if entity @s[scores={sleepTimerScore=-1}] run return run scoreboard players add @s sleepTimerScore 2

# if the player is still in bed, nothing left to do. exit.
execute store result score @s sleepTimerScore run data get entity @s SleepTimer
execute if entity @s[scores={sleepTimerScore=1..}] run return 0

tag @s remove is_sleeping

# everything below this point only runs if the player is no longer in bed

# recaulculate sleep rate since the number of players has changed
schedule function matcha:mechanics/sleeping/calculate_sleep_rate 1t

# display "n/n players sleeping" text in action bar
schedule function matcha:mechanics/sleeping/notify_sleeping_players 2t

