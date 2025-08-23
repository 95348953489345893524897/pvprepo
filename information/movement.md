HL2:DM Bug Guide (By Hman & Paradiser) https://steamcommunity.com/sharedfiles/filedetails/?id=910513517<br/>
Sourceruns Wiki - https://wiki.sourceruns.org/wiki/


# Propfly/Propsurf
- Propkill Spawnlist (From S0lum) - https://gist.github.com/95348953489345893524897/77ca18cdcbf3fe50f68b9938916453b2<br/>
  - Put in GarrysMod\garrysmod\settings\spawnlist<br/>
- How to Propkill (By Libre) - https://steamcommunity.com/sharedfiles/filedetails/?id=1880069764 <br/>

Since all of the videos from Libre's guide are privated, I'll attempt to explain and give videos for all the propfly techniques in the sections below: <br/>
## Basics of Propfly: 
Propfly is incredibly simple. When you practice enough, you will find it is simple too. Visit the [propkill servers](https://github.com/95348953489345893524897/configs/edit/main/information/movement.md#propkillpropfly-friendly-servers) to practice. <br/> 
### Binds
Binds are obviously important to getting good at propfly. I recommend that you have binds for AT LEAST a launching prop and a locker prop in your config to still allow for some versatility of movement.<br/>
<br/>
Bind prop spawn:<br/>
```bind %KEY% "gm_spawn %PROPMODELNAME%"``` <br/> 
<br/> 
This can be made even better through aliases though. <br/> 
If you create aliases for those prop spawns like [I do in my config](https://github.com/95348953489345893524897/configs/blob/main/valve.rc#L297-L323), you won't waste your time copy pasting prop model names whenever you want to change keybinds. <br/>
<br/> 
Alias prop spawn: ```alias %WHATEVERNAMEYOUWANT% "gm_spawn %PROPMODELNAME%"``` <br/>
<br/>
Then, you can do: ```bind %KEY% "%NAMEOFALIASYOUJUSTMADE%"``` <br/>
<br/> 
These are my binds: <br/>
Launching: **"V"** = ```"gm_spawn models/props_phx/wheels/metal_wheel1.mdl"``` <br/>
Lockers: **"C"** = ```"gm_spawn models/props_wasteland/controlroom_storagecloset001b.mdl"``` <br/>
Rebirding: **"G"** = ```"gm_spawn models/props_phx/construct/metal_plate4x4.mdl"```, or I sometimes  use ```"models/props_phx/construct/glass/glass_dome360.mdl"``` <br/>
Tide Gates: **"X"** = ```"gm_spawn models/props_debris/walldestroyed01a.mdl"``` <br/>
Coasters: I don't use them, but when I do, I bind them to **"G"** <br/>

### Settings
* Set your ```physgun_wheelspeed``` to a high number like 120/999999 <br/>
```physgun_wheelspeed 999999999``` is what I use <br/>
This makes your props move much faster when you scroll. It's necessary to propfly well. <br/>
You can just set it back to the default using ```physgun_wheelspeed 10``` if you want to build or are not propflying anymore. <br/>
* Unbind mousewheel <br/>
```unbind mwheelup; unbind mwheeldown``` <br/>
This makes it so that you aren't accidentally swapping weapons while propflying.
Having scrollwheel bound makes propfly extremely annoying.
* ESP/Scripts <br/>
I will not be explaining how to use ESP/Scripts for propkill since this is a guide for propfly. I do not use scripts unless I'm on propkill servers anyway. <br/>
If you want ESP for propkill follow the "script retrieval and SETUP" section of Libre's [guide](https://steamcommunity.com/sharedfiles/filedetails/?id=1880069764) <br/>

### Prop Types and Their Uses
Just like every propkiller has different binds, everyone also varies with which props they use. <br/>
<br/>
These are the most common props I've seen and their typical uses: <br/>
<br/>
Prop Meta: <br/>
```
Launching: Moped (For Boosting/Spidering)
Lockers: Lockers / Storage Closet (For Reversing/Rebirding)
Rebirding : Glass Dome / Tube4x4x1to2x2 (Just for rebirding)
Tide Gates : Tides Gate (ofc) / Walldestroyed01a (For Propkill)
Coasters: Any coaster in the coasters section (For Coastering obviously)
```
╔ **NOTE:** <br/>
║ ***USE THE PROP "META" UNTIL YOU MASTER IT !!!*** <br/>
║ ***WHEN YOU ARE COMFORTABLE WITH USING THE META/COMMONLY USED PROPS, MOVE ON TO DIFFERENT PROPS TO BETTER SUIT <br/>
║ YOUR PERSONALITY/PLAYSTYLE.*** <br/>
║ ***STARTING OUT WITH PROPS THAT ARE NOT IDEAL FOR PROPFLY WILL BE VERY DEMOTIVATING FOR YOU.*** <br/>
║ ***DOING THIS WILL MAKE SURE THAT DOESN'T HAPPEN.*** <br/>
╚ <br/>

I HIGHLY recommend downloading the propkill spawnlist. It makes finding the ESSENTIAL props for propfly much easier, and also has fun props to use. <br/>

### Intro to Basic Technique
* Holding Mouse1: <br/>
As you can see in the videos, most of the time I'm holding MOUSE1. This makes propfly way easier since I don't have to think about timing when I left click. <br/>

* Not using W or S like a moron: <br/>
Don't press W. Don't press S. <br/>
Unless you really know what you're doing, pressing W and S while propflying will only mess you up most of the time. <br/>
Just use the A and D keys for changing directions. <br/>
You should learn the basics of airstrafing before trying propfly (it's very simple and explained below don't worry). <br/>

* Basics of airstrafe: <br/>
This is very simple but some people might not know, so I explain it anyway. <br/>
If you are turning your mouse left, hold A. <br/>
If you are turning your mouse right, hold D. <br/>
I will explain combinations of W + D, W + A, S + A, and S + D keys eventually with a video. <br/>
For now, DON'T USE W AND S UNLESS YOU REALLY KNOW HOW IT AFFECTS AIRSTRAFING. <br/>

* Prop spawns: <br/>
Props spawn at a certain distance away from you if there is nothing in the way of your crosshair. <br/>
Understanding where they spawn while in the open air is a concept essential to the techniques ```rebirding, reversing, and forward reversing```. <br/>
Basically, you need to know the relationship between your velocity and the ideal prop spawn location (it isn't as complicated as it sounds) <br/>
I will eventually put a **video here** since it is probably insanely hard to visualize this concept. <br/>

### Launching (aka boosting)
Launching is the most basic propfly technique, essential to getting in the air (most of the time). <br/>
The best props to launch with are the launching props in the [launching props section](https://gist.github.com/95348953489345893524897/77ca18cdcbf3fe50f68b9938916453b2#file-045-props-txt-L751-L1027) of the spawnlist: <br/>
(Can be done with a lot of props like locker props, but it's a lot easier with the launching props) <br/>
![image](https://github.com/user-attachments/assets/98aa711d-c8e5-4a32-abd4-93711f3be27e)<br/>






https://github.com/user-attachments/assets/05da9628-4ce5-417b-b6df-c98878c6103b



To launch: 
1. Hold mouse1
2. Spawn the prop at your feet
3. Grab prop
4. Scroll inwards
5. Do a quick 180
6. Look upwards 
    - If you don't want to be launched very high, don't look up (basically just keep the same angle you had when you spawned the prop)
7. Undo prop
<br/>

### Coastering
Coastering is a technique for maintaining airtime easily <br/>
The best props to coaster with are in the [coasters section](https://gist.github.com/95348953489345893524897/77ca18cdcbf3fe50f68b9938916453b2#file-045-props-txt-L1079-L1097) of the spawnlist:<br/>
![image](https://github.com/user-attachments/assets/1c9c4fc2-59e2-4549-9ea1-de73043a6e87)<br/>


https://github.com/user-attachments/assets/a0c46c8e-213c-4beb-b833-6b011fc6bddf

To coaster:
1. Launch/spider/whatever to get air time
2. Spawn the coaster where you are about to land and freeze it (holding mouse1 makes this easier)
3. Go back into air

### Spidering

Spidering seems to just be a lazier way of boosting (in my opinion) <br/>
Maybe I just don't really know what spidering is though. <br/>
I think it's only used on maps with small skyboxes, like the propkill maps <br/>
I wouldn't really recommend doing it, I'd rather just launch normally because it makes you go almost straight up, making you an easy target <br/>
<br/>
The best props to spider with seem to be in the launching props section of the spawnlist <br/>

https://github.com/user-attachments/assets/a2edee72-a08e-4df6-9405-482948855c56

To spider: 
1. Jump
2. Spawn prop below you
3. Scroll inwards and look up

### Reversing
Reversing lets you 180 your velocity very quickly and accurately <br/>
It's also useful for moving quickly while staying a certain area <br/>
(when doing multiple reverses in quick succession, you're basically staying in the same area, but at a high velocity so you aren't an easy target) <br/>
<br/>
The best reversing props are in the [locker profile](https://gist.github.com/95348953489345893524897/77ca18cdcbf3fe50f68b9938916453b2#file-045-props-txt-L236-L319) section of the spawnlist: <br/> 
(you can also reverse with tide gates and the plate prop, but this is way less reliable than lockers.) <br/>
![image](https://github.com/user-attachments/assets/f4434539-a3d0-42b7-9774-e1151891420e)

https://github.com/user-attachments/assets/14e43d06-4254-4532-ae12-d74ac32c6e81

To reverse:
1. Launch/spider/whatever to get air time
2. Spawn prop in the direction you're going
3. Grab prop and scroll inwards
4. Quickly 180 using strafe keys and go in the opposite direction
5. Undo prop

### Forward Reversing
Like normal reversing, except this doesn't require 180s, and minimally changes your direction. <br/>
<br/>
The best forward reversing props are the same as the best reversing props.



https://github.com/user-attachments/assets/057af5bb-d1e9-426f-b74e-592dd915acda



To forward reverse:
1. Spawn prop in FRONT of where you are going (very important)
2. Grab prop and scroll inwards
3. Use strafe keys to turn AWAY from the spot you spawned the prop
4. Use strafe keys to turn back to direction you were originally going
5. Drag prop while turning to go wherever you want
6. Undo prop 

### Rebirding 
Rebirding is a way to stay in the air if you start getting too close to the ground (like coastering) or if you just want to go higher up quickly (like spidering) <br/>
<br/>
You can rebird with just about any prop, but the best ones are obviously in the [rebirding props section](https://gist.github.com/95348953489345893524897/77ca18cdcbf3fe50f68b9938916453b2#file-045-props-txt-L1031-L1099) of the spawnlist: <br/>
(Other notable props that can be used for rebirding are lockers if you time them right, and large flat props like the plate) <br/>
![image](https://github.com/user-attachments/assets/2f411d84-8d20-4b3d-bfba-409ccc49ab45)


https://github.com/user-attachments/assets/ff217ca5-2d91-4508-a941-daa4b2207c24


To rebird:
1. Spawn prop a little bit down and ahead of where you are going
   - How far ahead you should spawn it depends mainly on your velocity, if you are close to a surface to spawn props on, and tickrate a little bit
3. Scroll inwards and look up

### Side Rebirding
I'm not exactly sure how to do this, and I can't reproduce it consistently, so I won't even attempt to explain. Propkillers better than me can probably explain this one to you. <br/>

### Propkill/Propfly friendly Servers:
  - Iced Coffee's Propkill 103.217.254.28:27015<br/>
  - propkill la 45.32.78.141:27015<br/>
  - EU PROPKILL 51.254.7.253:27015<br/>
  - chicago propkill server thing 69.39.225.6:27015<br/>
  - propkill.net (on the sandbox gamemode) 143.198.159.117:27015<br/>
  - Zbox (don't propkill here, most people will get annoyed, but propfly is OK with most people and easy to do here) 193.243.190.18:27064 <br/>
  - T9C Sandbox (Anarchy sandbox server, propkill/propfly all you want here) 78.108.218.110:26000 <br/>
  
# Sidehopping  
  - Sidehopping is one of the most common ways to get around in vanilla sandbox servers. I've been able to reach around 6000-7000 velocity before, I'm not sure what the limit is.<br/>
    - Sidehopping tutorial - https://www.youtube.com/watch?v=ArMJ5qALBXY<br/>
      - Crouching left sidehop (0:02 - 1:47)<br/>
      - Crouching right sidehop (1:51 - 3:06)<br/>
      - Demonstration (3:13 - 6:50)<br/>
    - Video is ridiculously slowed down which I will fix later probably<br/>
    
   ## How to Crouching Sidehop:
      1. Crouch-jump and turn 90 degrees (left or right)
      2. Jump and don't let go of crouch. 
      3. Jump every time you hit the ground
      4. While you are in the air, turn your aim in the direction corresponding to the side you turned on
        - Aiming in the wrong direction will either make you go in a direction other than where you want, or it will instantly kill your velocity.
        - If you turned left 90 degrees:
          - Turn your aim left if you are going forwards, and turn your aim right if you are going backwards
        - If you turned right 90 degrees:
          - Turn your aim right if you are going forwards, and turn your aim left if you are going backwards
      - Notes: 
        - You shouldn't be touching any movement keys while you do this, because more than likely they'll just mess up your timing/direction.
          - An exception is when you are curving the strafe away from walls with keys like W and S.
        - You can do sidehops while standing, but it's much harder.
  ## How to Standing Sidehop:
      1. Start a crouching sidehop
      2. Once you reach around 2000 velocity (8-10 hops), crouch jump
        - Crouch jump by releasing crouch mid-air, then pressing crouch + space at the same time 
      3. Continue to sidehop like normal, except now you are standing. Understanding the direction is considerably more difficult and there is less speed benefit, so this method is pretty much just for flashiness or fun.

# Super Garry's Mod Server exclusive movement
  - Most of the Super Garry's Mod movement techniques like potato jumping and washing machine boosts should work similarly on Zoltins Sandbox<br/>
  - SGMS fast guide (By Bikes) - https://www.youtube.com/watch?v=x52LSlBOCJY<br/>
    - Explains movement tech in the Super garry's Mod Server: <br/>
      1. Potato jumping (0:54 - 1:20)<br/>
      2. Washing Machine boosting (1:25 - 1:52)<br/>
      3. Plate Jumping (1:56 - 2:45)<br/>
      4. Demonstration (2:47 - 3:00)<br/>
      5. Horizontal Plate Boost (3:01 - 3:30)<br/>
  - how to move around with prop and such (By Bikes) - https://youtu.be/YU5ZIUSSpt8<br/>
    - The other tutorial he made is a lot better so I'm not going to timestamp the video. <br/>

# Accelerated Backwards / Accelerated Forwards / Accelerated Side Hopping
- ABH, AFH, and ASH are not possible on vanilla servers. <br/>
- Some servers like Friendly Garry's Mod Community (5.161.119.176:27015) and Neotek Gaming (74.91.116.249:27015) have ABH/AFH addons that make it possible.  <br/>
  - How to Backhop in Half-Life 2 (By Burny) - https://www.youtube.com/watch?v=EfRIMwWbyrQ <br/>
    1. Accelerated Backhopping (0:33 - 1:02)<br/>
    2. Accelerated Sidehopping (1:03 - 1:27)<br/>
    3. Standing ABH (1:27 - 1:52)<br/>
    4. Standing ASH (1:52 - 2:04)<br/>
    5. Standing ABH without walking (2:05 - 2:20)<br/>
    6. Standing ASH without walking (2:22 - 2:34) <br/>
    7. Accelerated Forward Hopping (2:54 - 3:18) -- The circle strafe he does isn't needed to AFH but gives a bit more starting speed<br/>

# Undoboosting/Cameraboosting
-  add later

# Wallstrafing
- add later

# Circlestrafing
- Does circle strafing even have an effect on sandbox? figure out later

# Balloons (For scaling walls)
- Demonstration - https://youtu.be/-4LRnP6-fvM<br/>
  1. Add explanation later

# Bill's Big Thrill
Bill's Big Thrill (BBT) is a speedrunning trick discovered in HL2. It allows you to enter a noclip-like state, teleport, and offset your hitbox, causing [some?] player tracking E2s to track the wrong hitbox. <br/>
<br/>
How it works: 
  - Brushing a prop against the tangent of the bounding box of a wheel gives it glitched collisions (has to be a real wheel from the Jeep, Jalopy, APC, etc., not just the wheel prop).
  - When the player collides with the prop by touching it, they also get the same glitched collisions, causing them to float, among other things (explained later). <br/>

<img width="1920" height="1080" alt="poster-25-08-22 08-36-11 2" src="https://github.com/user-attachments/assets/4b3c759b-5dfd-42aa-b500-9e054290d6c0" /> <br/>
`Bounding boxes of Jeep and barrel.` <br/>
<br/>
To do BBT, you need to brush a prop against the bounding box of the wheel of the Jeep or Jalopy without having it collide with the vehicle itself. This is done by running the prop against the tangent of the bounding box's sphere. <br/>
<br/>
<img width="200" height="200" alt="tangent-radius" src="https://github.com/user-attachments/assets/e1d090c9-08d5-4cec-b62a-f2f12bb12244" /> <br/>

<img width="330" height="259" alt="image" src="https://github.com/user-attachments/assets/adfd2ef6-82ce-46e7-a7ff-19f8f144ea91" /> <br/>
`The blue line is the tangent of the bounding box. This is what the prop is supposed to brush against.` <br/>

<br/>

<img width="305" height="179" alt="image" src="https://github.com/user-attachments/assets/828679eb-ebef-4cd1-92c8-67c0a983f134" /> <br/>
`Drawing of what the collision box probably looks like` <br/>

An important step to BBT is that you **cannot** let the prop collide with the wheel or Jeep itself. It is only brushing against the bounding box, not the collision box (orange circle in image above) <br/>

<img width="344" height="233" alt="image" src="https://github.com/user-attachments/assets/c1e921cf-1e5d-424a-b464-4901496b3e82" /> <br/>
`There is a small amount of space between where the bounding box ends and where the prop will start colliding with the wheel.` <br/>
<br/>



https://github.com/user-attachments/assets/e4d54a26-256d-4f49-b7a0-45025b1f8be0


The easiest way to do BBT is to practice in Singleplayer: <br/>
  ```
  1. sv_cheats 1; developer 1 in console
  2. Spawn a jeep
  3. Put ent_bbox in console while looking at it
  4. Spawn a prop like the oil drum, ent_bbox it too if you feel like
  5. Grab it (physgun, E, gravity-gun, whatever)
  6. Line up the prop to touch the bounding box (green sphere) but not the inner collision box (orange circle in diagrams)
     - This is done by sight, you will know that it is colliding when the prop is moving weirdly up or down 
  7. Press W and S to move forward and backwards until the prop starts floating oddly
  8. Run into the prop
  9. Use the precision tool to push the prop (right click)
    - If you don't use the precision tool or some other tool to freeze it, the prop will get deleted because of its high velocity (due to sv_crazyphysics_remove 1).
  10. Crouch to get out of noclip state
  11. "ent_bbox player" in console to see your Havok box
```
## Side Effects:
Controlled Teleporting: 

https://github.com/user-attachments/assets/2faeef9a-7830-4cc9-95ed-5d69d8bbe35f


- "Saving" your Havok box by crouch jumping essentially lets you set down a teleport location.
- When you collide with a prop (not the original glitched prop) you will be sent to that location.
- This can be used like the old [Minecraft "Pearl Hanging" exploit](https://youtu.be/eCVVDstvd3c?t=19)

Messing with E2 targetting:

- I don't have a video or 100% confirmation of this, but it seems that some E2s or targeters try to track your Havok box instead of you [needs more research].
- This makes contraptions like targetting wire turrets track the completely incorrect hitbox, helping you survive them. 

Noclip:


https://github.com/user-attachments/assets/446a75c8-5419-4b70-94a9-54423b2b2070


- When in the glitched state, you are in a very limited noclip.
- It is extremely hard to turn
- You can go through walls though, one of the main uses of this
<br/>
Prop Welding:



https://github.com/user-attachments/assets/56d89b9d-c0f7-4b98-9ae8-5a917864a4be


- Under certain conditions, all props that collide with your Havok box will start welding to it. The props that collide with those welded props will also weld themselves together.
- When you respawn, these welds go away (since there is no collision with the original glitched prop anymore, a new life)
- Do not weld too many props together, especially vehicles, because when you respawn and all the welds are undone your game will freeze
<br/>
Reboosting / velocity sharing:


https://github.com/user-attachments/assets/f55db1b9-f950-457e-bd74-971d4590efb1


- During the noclip state you are share the [starting?] velocity of the glitched prop. 
- If you get out of the noclip state, you can still enter it again by bumping or slamming a prop into your Havok box. 

Winding: 



https://github.com/user-attachments/assets/79d7753b-0d57-4096-a6ac-ab16b8540bb2


- By saving your Havok box and then running up and down sloped map geometry, you can "wind up" the Havok box.
- After it gains a favorable height, you can run into a prop to teleport to your Havok box
- I'm not sure how to wind it down, the collision of the player with the map probably starts at your feet, not your head (speculation).

## Caveats: 
- Using the Precision tool is basically required in order to prevent the prop from getting removed by [crazy physics](https://github.com/Kefta/gs_crazyphysics).
- The Jeep [and glitched prop?] must not be touching any player or NPC. If either touch the jeep, the collisions are reset and the glitched state stops.
