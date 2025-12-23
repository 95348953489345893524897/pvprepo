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
