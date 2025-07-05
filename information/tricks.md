# Base glitching with no-collide/precision 
  - add later<br/>
  - add example video later<br/>

# ULX Psay spam to locate players 
https://github.com/TeamUlysses/ulib/blob/94312ede535fc0a863d0d29cbfaf5cc959395e67/lua/ulib/shared/player.lua#L25 - "@" argument for ulx code, accuracy is explained at line 15
https://github.com/95348953489345893524897/configs/blob/c0ee0b1b6f92773cb424c19fde8821495925d464/valve.rc#L342
  - !pm '@ message' (also 'ulx psay @' in console) is used to pm the player in the direction that you are facing <br/>
  - Since the '@' argument for ulx commands shows if your command hit a target (a player), you can use it to locate people in large maps <br/>
  - Binding a key like b to "ulx psay @" lets you spam blank messages in any direction.<br/>
    - If the psay hits a target, it'll say this:
     ```Usage: ulx psay <player> {message} - Send a private message to target. (say: !p)```
    - This can tell you when you're looking in the general direction of a player, because it only says this in chat when you are.<br/>
    - By knowing where a player is and isn't like this, you can find them much faster.<br/>
    - You can also put in a message to know exactly which player is you're looking at, but it becomes spammy and people will get annoyed you are filling their chat with PMs.<br/> 
  - Add example video later

# Picked up weapon trails
  - Trails placed on weapons using the trail tool will still persist even when the weapon is picked up.<br/>
  - This lets you have trails on yourself without using wire/e2/starfall<br/>
  - add example video later

