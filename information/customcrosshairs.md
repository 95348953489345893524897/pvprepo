# Premise:
   - ```hud_draw_fixed_reticle 1``` shows a crosshair no matter what. <br/>
     - Replacing texture of the fixed reticle allows us to make custom crosshairs. <br/>
  
You may want a custom crosshair because ```crosshair_setup``` (console command for customizing base crosshair) does not have the crosshair shape you want, or weapon packs like M9K snipers remove your crosshair. <br/>

The texture's path is:
```hl2_textures.vpk\materials\vgui\hud\xbox_reticle.vtf``` 
For the purpose of the guide you can ignore the hl2_textures.vpk path. <br>

# To make a custom crosshair:
1. Create a folder named CustomCrosshair in \GarrysMod\garrysmod\addons.
     - If you don't know how to get to your local files [follow this guide](https://steamcommunity.com/sharedfiles/filedetails/?id=760447682).
2. Replicate the path to the fixed reticle
     - Make a folder inside CustomCrosshair named "materials", then "vgui", then "hud", your final path should look like: ```\CustomCrosshair\materials\vgui\hud```
3. ```Import``` a custom crosshair image into VTFEdit (<ins>Put separate gist file to explain how to do that here </ins>)
4. ```"Save as"``` the image as xbox_reticle.vtf in the innermost CustomCrosshair subfolder.
     - Your final path should look like: ```\CustomCrosshair\materials\vgui\hud\xbox_reticle.vtf```
