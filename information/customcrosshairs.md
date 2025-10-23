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
3. Find a custom crosshair image you like <br/>
      - For the guide I will be using this crosshair made with the [Kovaak's Crosshair Generator](https://crosshair.themeta.gg/). 

   <img width="60" height="60" alt="KovaaK-Crosshair(1)" src="https://github.com/user-attachments/assets/359f98cd-59e0-4af3-ae29-660a44b78e42" />


5. ```Import``` that custom crosshair image into VTFEdit (<ins>Put separate gist file to explain how to do that here </ins>)
<img width="468" height="397" alt="import" src="https://github.com/user-attachments/assets/deceaf3d-b5de-428f-b8c2-1c94c16e40f3" />

6. Copy these settings and press ```OK```

<img width="468" height="397" alt="image" src="https://github.com/user-attachments/assets/6fc84b07-4ef3-46e4-abb4-88d5eeccaca5" /> <br/>
      - Mess with the clamp width and length if your crosshair exports weirdly


8. ```"Save as"``` the image as xbox_reticle.vtf in the innermost CustomCrosshair subfolder (\hud).
     - Your final path should look like: ```\CustomCrosshair\materials\vgui\hud\xbox_reticle.vtf```


<img width="468" height="397" alt="saveas" src="https://github.com/user-attachments/assets/a238ee23-9565-4dd8-8b5c-8a8545dc4489" />

9. Click ```Create VMT File```
      - This will create xbox_reticle.vmt in ```\CustomCrosshair\materials\vgui\hud\```
    <img width="468" height="397" alt="image" src="https://github.com/user-attachments/assets/ada4b26b-cee5-407d-ba55-11f63f236b4d" />
10. Edit ```xbox_reticle.vmt```
	- Copy paste this code inside of ```xbox_reticle.vmt```
```
UnlitGeneric
{
   "$basetexture" "vgui/hud/xbox_reticle"
	$alphatest		1
	$alphatestreference		0.1		         // If 0.1 doesnt work set to 0.01
	$allowalphatocoverage	1
	$color 			         "[20 20 20]"      // You may want to mess with this depending on how bright you want the crosshair to be or to quickly change its colors
}
```
<img width="468" height="397" alt="image" src="https://github.com/user-attachments/assets/e5649a29-2d79-404a-a9b8-ef39d4768e20" />

11. Test your crosshair in game with ```hud_draw_fixed_reticle 1```
      - If it is an odd size  then edit your original crosshair image and reimport.
      - If it is an odd color then change ```$color "[r g b]"``` in the vmt's code.
