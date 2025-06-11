1/14/2025 GMOD Cvarlist - https://pastebin.com/raw/9HwNDj5c 
Useful config scripting info - https://www.reddit.com/r/tf2scripthelp/wiki/


# Incrementing alias
This alias can create a toggle because it goes through two commands in two runs
```
alias 	"run" 		"run1"			                  // Create original alias that will be modified eventually
alias 	"run1"		"alias run run2; command1"    
// pressing the key bound to "run" runs "run1", which runs command 1, and then changes the original "run" command to become "run2"
alias 	"run2" 		"alias run run1; command2"
// Now that "run" is set to be "run2", command2 is run when the key bound to "run" is pressed 
bind "space" "run" // Pressing space once will do command1, and then the second time space is pressed it will do command2
```
Real example: 
```
bind key "zoomtoggle"  // Make bind for the command

alias 	"zoomtoggle" 		"zoomtoggle1"					
alias 	"zoomtoggle1"		"alias zoomtoggle zoomtoggle2; +zoom"    // Use +zoom when I press the key
alias 	"zoomtoggle2" 		"alias zoomtoggle zoomtoggle1; -zoom"  // Stop zooming in when I press the key again
```
Using this, you have now made a way of making held down buttons toggleable. 
This isn't particularly useful in the case of +zoom since you can just use toggle_zoom, but there are other commands incrementing aliases can make into toggle commands.

# Longer incrementing alias
```
alias 	"run" 		"run1"			                 
alias 	"run1"		"alias run run2; command1"    
alias 	"run2" 		"alias run run3; command2"
alias 	"run3" 		"alias run run4; command3"
alias 	"run4" 		"alias run run1; command4"    
                        // HERE ^
                          // Making sure that the last "runN" command returns to run1, shown by the 'HERE ^', is necessary to make sure that the increment restarts itself.
bind space run // Pressing space for the Nth time will run commandN, where N = the amount of times space was pressed.
```

Real Example:
```
alias 	"ortsmeiser" 		"ortsmeiser1"			                 
alias 	"ortsmeiser1"		"alias ortsmeiser ortsmeiser2; say johnyplayer12: I THINK ORTSMEISER IS CHEATING"    
alias 	"ortsmeiser2" 		"alias ortsmeiser ortsmeiser3; say palfriend2: ADMIN KICK HIM"
alias 	"ortsmeiser3" 		"alias ortsmeiser ortsmeiser4; say coolandkind: PLZ KICK ORTSMEISER"
alias 	"ortsmeiser4" 		"alias ortsmeiser ortsmeiser1; say calmandcool: ortsmeiser he is cheater"    
```
Ortsmeiser is the one who originally introduced me to this 
One of the common uses for longer incrementing aliases is to copy paste and cycle through hackussations from other players
It can be incremented much longer than for 4 commands, I've gotten it to 500 with no issues.

# Incrementing alias using + and - commands
This works almost the same as a normal incrementing alias, except that it can do a different command on the press and release of the key.
```
alias +run "+run1"                        // Create original alias that will be modified eventually
alias -run "-run1"                        // Ditto ^


alias +run1 "alias +run +run2; CommandOnPress1"     
// Pressing the key bound to "+run" runs CommandOnPress1, and then changes the original "+run" command to become "+run2"
alias -run1 "alias -run -run2; CommandOnRelease1"
// Releasing the key bound to "+run" runs CommandOnRelease1, and then changes the original "-run" command to become "-run2"
alias +run2 "alias +run +run1; CommandOnPress2"
// Now that "+run" is set to be "+run2" now, CommandOnPress2 is ran when the key bound to "+run" is pressed
alias -run2 "alias -run -run1; CommandOnRelease2"
// Now that "+run" is set to be "+run2" now, CommandOnRelease2 is ran when the key bound to "+run" is released
```
This type of incrementing alias is useful for when you want to use press/release commands like +attack but also have the increment change when you release the key.
Setting a +command to be ran using a normal alias does not work, so it has to be made into a +alias.
For example: 
```
alias examplename "+command"
```
Does not work.
So, the typical method of incrementing aliases would also not work.
```
alias 	"run1"		"alias run run2; +command"   
```
Does not work properly
```
alias +run1 "alias +run +run2; +command" 
```
```
alias +run1 "alias +run +run2; -command
```  
Does work as long as the second line also exists

Real example:
```
// fast switch m9k weapons by clicking, which cancels the pullout animations more reliably  
alias +m9kswitch "+m9kswitch1"
alias -m9kswitch "-m9kswitch1"
alias +m9kswitch1 "alias +m9kswitch +m9kswitch2; +attack"
alias -m9kswitch1 "alias -m9kswitch -m9kswitch2; -attack"
alias +m9kswitch2 "alias +m9kswitch +m9kswitch1; lastinv"
alias -m9kswitch2 "alias -m9kswitch -m9kswitch1; "
// bind mouse1 +m9kswitch
```
//--------------------------------
TF2 Random Script Maker - https://codepen.io/ytythythtyhytjtyjytjytj/pen/bxMrjy 
