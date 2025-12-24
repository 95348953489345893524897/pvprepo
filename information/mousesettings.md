Not many gmod players outside of people in aim communities really understand these settings, so I'll write them here for easy understanding. <br/>
There are some essential mouse settings that should be enabled or disabled outright, and then there are some that are simply preference.

# How to get to the mouse settings
Go to the menu, press Options, then press "Mouse" in the top tab of the window that pops up. <br/>
<img width="134.5" height="167" alt="image" src="https://github.com/user-attachments/assets/43fa5553-3bd0-413b-97cd-7f55b8f38430" />

<img width="253" height="199" alt="image" src="https://github.com/user-attachments/assets/b57241b4-e14e-4cd7-8781-ad416cbf48fc" /> <br/>
Alternatively you can enter <br/>
```find m_```<br/>
in console and it shows the mouse settings. The internal ConVar name will be listed in each section regardless. 
# "Mouse Filter"
```ConVar name: m_filter``` <br/>
<br/>
Set this to 0. <br/>
<br/>
Mouse filtering averages your mouse input over the last 2 frames, meaning that your input is both FPS-based and has unnecessary input lag. <br/>
Due to how bad Gmod servers can get, FPS-based input in Gmod will give your aim **insane inconsistency**<br/>
As your FPS gets lower, the lag of mouse filtering is more noticable because of the small samples of input to average.<br/>

Long explanation: <br/>
m_filter was made as a workaround for the outdated Win95 input system (Source: [John Carmack, its creator](https://github.com/ESWAT/john-carmack-plan-archive/blob/cab9497f3b22194314a29513d3d03301fbfe7521/by_year/johnc_plan_1998.txt#L824)), which had a hard limit on the polling rate of mice of only [40HZ](https://tscherwitschke.de/old/mouseratechecker.html#:~:text=mice%20are%20also%20sampled%20with%2040hz) ([But what is polling rate?](https://www.xbitlabs.com/blog/what-is-polling-rate/#:~:text=What%20Is%20Mouse%20Polling%20Rate%3F)) <br/>
Windows is now able to handle mouse polling rates of at least 8000 HZ, 200 times the polling rate of the mice that mouse filtering was made for. <br/>
[Read more about it in my original post](https://github.com/Facepunch/garrysmod-requests/issues/2761)

# "Raw Input"
```ConVar name: m_rawinput```
<br/>
Set this to 1. <br/>
<br/>
With raw input off, Windows handles your input before it is taken by the game. Windows's mouse settings like OS level sensitivity and mouse acceleration can drastically change how your aim feels in game and add input lag. Having raw input on in games has been a standard for a decade at **least**, with most games forcing it enabled, such as [Counter-Strike 2](https://developer.valvesoftware.com/wiki/List_of_Counter-Strike_2_console_commands_and_variables), [Overwatch 2](http://web.archive.org/web/20151101013626/http://us.battle.net/forums/en/overwatch/topic/19615281339#:~:text=We%20use%20only%20unadjusted%20raw%20input%20for%20our%20input%20handling%20(except%20when%20in%20the%20UI)%20as%20is%20common%20for%20FPS's), [Valorant](https://playvalorant.com/en-us/news/game-updates/valorant-patch-notes-11-06/#:~:text=The%20RawInputBuffer%20setting%20has%20been%20removed%20and%20is%20no%20longer%20configurable.%20The%20setting%20will%20be%20enabled%20at%20all%20times%20for%20players%20because%20it%20is%20more%20performant.), and Kovaak's (Get confirmation later) <br/> 

Long explanation: <br/>
The leak of the HL2 source code [uses WM_INPUT](https://git.botox.bz/BotoX/hl2_src-leak-2017/src/commit/21b3eba5306aa277cf169fcbf56fc14ef84a2974/src/inputsystem/inputsystem.cpp#L1456), which is an element of the [WIN32 Raw Input API](https://learn.microsoft.com/en-us/windows/win32/inputdev/raw-input). I'm not a game developer, so I will refrain from trying to explain how this works. The gist is that Raw Input lets the application capture mouse input before it is affected by anything else in the operating system (Windows mouse accel, pointer speed, etc.)

Another, albeit small, issue with having raw input off is that it makes following the standards of CM/360 much harder. CM/360 is a measurement of how many Centimeters you need to move your mouse to turn 360 degrees in game. It's a widely accepted standard for translating different sensitivities and DPIs between games. Raw input is always assumed when talking about one's CM/360, so turning it off makes it more difficult to compare sensitivities between games or people. For example, if someone else's sensitivity is 1, DPI 1600 then it's no problem. That can be calculated easily as [25.9 CM](https://kovaaks.com/kovaaks/sens-converter). However, if they have raw input off, then more unnecessary variables are added to the equation: <br/>
```
Do they have a different Windows mouse sensitivity?
How do you convert from non-default Windows mouse sensitivites like 11 back to the baseline default 6?
Are they using Windows mouse acceleration (EPS)? How do you convert this to another acceleration curve like RawAccel?
```
All of these pointless variables are taken away by simply following the standard, which is having raw input on. <br/>
<br/>
<img width="265" height="102.5" alt="image" src="https://github.com/user-attachments/assets/2e2b195f-8030-47aa-84ed-beab3f511a42" /> <br/>
Windows mouse options.
