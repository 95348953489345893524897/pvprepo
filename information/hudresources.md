TF2 HUD Tutorials (By Raysfire) - https://www.youtube.com/playlist?list=PL5eNrB8RrXXvohogCcKNKyk9SJxa26ltz<br/>
Valve Dev wiki page on hudlayout.res - https://developer.valvesoftware.com/wiki/HudLayout.res<br/>
TF2 Hud Reference (By JarateKing) https://github.com/JarateKing/TF2-Hud-Reference/<br/>

# HL2 PRED'S HUDS (HPH.exe HUD maker) https://gamebanana.com/mods/345189 
HPH.exe makes the process of making a HUD a lot simpler, but it isn't meant for Garry's Mod, it was made for HL2, so it runs into some problems <br/>
  - ***BACK UP THESE FOLDERS*** If you're going to use a hud from HPH, backing these up makes fixing the issues MUCH easier
    - GarrysMod\garrysmod\HPH\scripts
    - GarrysMod\garrysmod\HPH\cfg         // This folder isn't necessary at all, and you should probably delete it. It overwrites valve.rc, which is the file that my config uses.
    - GarrysMod\garrysmod\HPH\materials
    - GarrysMod\garrysmod\HPH\media
    - GarrysMod\garrysmod\HPH\resource
  # Issues with Pred's and their fixes
## Chat filters being wrong / extra option
    1. Replace GarrysMod\garrysmod\resource\ui\chatfilters.res with yourhudbackupfolder\resource\ui\chatfilters.res
## Killfeed icons being wrong
      1. Replace "HL2MPTypeDeath" section in GarrysMod\garrysmod\resource\ClientScheme.res with "HL2MPTypeDeath" section in yourhudbackupfolder\resource\ClientScheme.res
      2. Copy GarrysMod\garrysmod\resource\HL2MP.ttf and paste into GarrysMod\garrysmod\resource\fonts"
## Captions font being too small 
      Will find solution later probably (definitely a simple fix, and probably in ClientScheme.res)
## 'TargetIDSmall' isn't a valid font / performing arithmetic on w cl_targetid.lua error  
      1. Copy this: https://gist.github.com/95348953489345893524897/42ea70d17f64e3f89bc7da5ab649e4df (Thanks Redox)
      2. Paste into GarrysMod\garrysmod\resource\ClientScheme.res under the "TargetID" section
## Font showing player name is too big / weird looking
      1. Replace "TargetID" section in GarrysMod\garrysmod\resource\ClientScheme.res with "TargetID" section in yourbackupfolder\resource\ClientScheme.res
## GMOD startup screen being lambda symbol
      1. Delete these files:
        - GarrysMod\garrysmod\materials\console\background01.vtf
        - GarrysMod\garrysmod\materials\console\background01_widescreen.vtf
        - GarrysMod\garrysmod\materials\console\background01.vmt
        - GarrysMod\garrysmod\materials\console\background01_widescreen.vmt
## Weapon Icons being boxes / weird looking
      1. Replace "WeaponIconsSelected" section in GarrysMod\garrysmod\resource\ClientScheme.res with "WeaponIconsSelected" section in yourhudbackupfolder\resource\ClientScheme.res
      2. Replace "WeaponIcons" section in GarrysMod\garrysmod\resource\ClientScheme with "WeaponIcons" section in yourhudbackupfolder\resource\ClientScheme.res
## Weapon Selection numbers being too big
      1. Replace "HudSelectionNumbers" section in ClientScheme.res
## Console font being wrong
    Can't remember solution 
## Chat font being wrong / weirdly bold / crunched
      1. Replace the  fonts sections in GarrysMod\garrysmod\resource\ChatScheme.res with the fonts sections in yourhudbackupfolder\resource\ChatScheme.res
          
