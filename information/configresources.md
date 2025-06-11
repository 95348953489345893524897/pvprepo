1/14/2025 GMOD Cvarlist - https://pastebin.com/raw/9HwNDj5c 

Useful config scripting info - https://www.reddit.com/r/tf2scripthelp/wiki/


# Incrementing alias
This alias can create a toggle because it goes through two commands in two runs
```
alias 	"run" 		"run1"			                  // Create original alias that will be changed on keypress
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
bind "space" "run"            // Pressing space for the Nth time will run commandN, where N = the amount of times space was pressed.
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

So, the usual method of incrementing aliases would also not work.
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
# Pseudorandomization of increments (2 increment aliases working together)
TF2 Random Script Maker - https://codepen.io/ytythythtyhytjtyjytjytj/pen/bxMrjy 

Randomization of the incrementing is not possible, but pseudorandomization can be done by binding a ticker to a different key than the main increment.
```
// Main increment alias
alias run_1 "say taco; run_tick"
alias run_2 "say apple; run_tick"
alias run_3 "say banana; run_tick"

// Secondary 'unused' increment alias
alias run_tick_1 "alias run run_2;alias run_tick run_tick_2"
alias run_tick_2 "alias run run_3;alias run_tick run_tick_3"
alias run_tick_3 "alias run run_1;alias run_tick run_tick_1"


alias run run_1;
alias run_tick run_tick_1;

bind space +jump; run_tick
bind b "run" 
```

Basically what this does is make the incrementing seem random by running through it (by pressing space) without executing the command (the command is executed by B, bound to "run")


Real example:
```
alias pseudorandom_playermodel_1 "cl_playermodel alyx; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_2 "cl_playermodel barney; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_3 "cl_playermodel breen; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_4 "cl_playermodel chell; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_5 "cl_playermodel eli; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_6 "cl_playermodel gman; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_7 "cl_playermodel kleiner; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_8 "cl_playermodel monk; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_9 "cl_playermodel mossman; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_10 "cl_playermodel mossmanarctic; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_11 "cl_playermodel odessa; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_12 "cl_playermodel magnusson; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_13 "cl_playermodel police; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_14 "cl_playermodel policefem; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_15 "cl_playermodel combinesoldier; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_16 "cl_playermodel combinesupersoldier; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_17 "cl_playermodel combinesoldierprisonguard; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_18 "cl_playermodel soldierstripped; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_19 "cl_playermodel corpse1; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_20 "cl_playermodel charple; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_21 "cl_playermodel skeleton; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_22 "cl_playermodel zombie; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_23 "cl_playermodel zombiefast; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_24 "cl_playermodel zombine; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_25 "cl_playermodel female01; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_26 "cl_playermodel female02; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_27 "cl_playermodel female03; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_28 "cl_playermodel female04; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_29 "cl_playermodel female05; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_30 "cl_playermodel female06; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_31 "cl_playermodel female07; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_32 "cl_playermodel female08; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_33 "cl_playermodel female09; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_34 "cl_playermodel female10; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_35 "cl_playermodel female11; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_36 "cl_playermodel female12; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_37 "cl_playermodel medic01; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_38 "cl_playermodel medic02; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_39 "cl_playermodel medic03; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_40 "cl_playermodel medic04; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_41 "cl_playermodel medic05; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_42 "cl_playermodel medic06; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_43 "cl_playermodel medic07; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_44 "cl_playermodel medic08; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_45 "cl_playermodel medic09; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_46 "cl_playermodel medic10; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_47 "cl_playermodel medic11; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_48 "cl_playermodel medic12; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_49 "cl_playermodel medic13; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_50 "cl_playermodel medic14; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_51 "cl_playermodel medic15; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_52 "cl_playermodel male01; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_53 "cl_playermodel male02; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_54 "cl_playermodel male03; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_55 "cl_playermodel male04; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_56 "cl_playermodel male05; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_57 "cl_playermodel male06; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_58 "cl_playermodel male07; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_59 "cl_playermodel male08; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_60 "cl_playermodel male09; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_61 "cl_playermodel male10; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_62 "cl_playermodel male11; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_63 "cl_playermodel male12; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_64 "cl_playermodel male13; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_65 "cl_playermodel male14; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_66 "cl_playermodel male15; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_67 "cl_playermodel male16; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_68 "cl_playermodel male17; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_69 "cl_playermodel male18; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_70 "cl_playermodel hostage01; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_71 "cl_playermodel hostage02; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_72 "cl_playermodel hostage03; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_73 "cl_playermodel hostage04; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_74 "cl_playermodel arctic; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_75 "cl_playermodel gasmask; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_76 "cl_playermodel guerilla; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_77 "cl_playermodel leet; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_78 "cl_playermodel phoenix; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_79 "cl_playermodel riot; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_80 "cl_playermodel swat; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_81 "cl_playermodel urban; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_82 "cl_playermodel dodamerican; pseudorandom_playermodel_tick"
alias pseudorandom_playermodel_83 "cl_playermodel dodgerman; pseudorandom_playermodel_tick"

alias pseudorandom_playermodel_tick_1 "alias pseudorandom_playermodel pseudorandom_playermodel_2;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_2"
alias pseudorandom_playermodel_tick_2 "alias pseudorandom_playermodel pseudorandom_playermodel_3;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_3"
alias pseudorandom_playermodel_tick_3 "alias pseudorandom_playermodel pseudorandom_playermodel_4;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_4"
alias pseudorandom_playermodel_tick_4 "alias pseudorandom_playermodel pseudorandom_playermodel_5;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_5"
alias pseudorandom_playermodel_tick_5 "alias pseudorandom_playermodel pseudorandom_playermodel_6;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_6"
alias pseudorandom_playermodel_tick_6 "alias pseudorandom_playermodel pseudorandom_playermodel_7;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_7"
alias pseudorandom_playermodel_tick_7 "alias pseudorandom_playermodel pseudorandom_playermodel_8;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_8"
alias pseudorandom_playermodel_tick_8 "alias pseudorandom_playermodel pseudorandom_playermodel_9;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_9"
alias pseudorandom_playermodel_tick_9 "alias pseudorandom_playermodel pseudorandom_playermodel_10;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_10"
alias pseudorandom_playermodel_tick_10 "alias pseudorandom_playermodel pseudorandom_playermodel_11;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_11"
alias pseudorandom_playermodel_tick_11 "alias pseudorandom_playermodel pseudorandom_playermodel_12;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_12"
alias pseudorandom_playermodel_tick_12 "alias pseudorandom_playermodel pseudorandom_playermodel_13;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_13"
alias pseudorandom_playermodel_tick_13 "alias pseudorandom_playermodel pseudorandom_playermodel_14;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_14"
alias pseudorandom_playermodel_tick_14 "alias pseudorandom_playermodel pseudorandom_playermodel_15;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_15"
alias pseudorandom_playermodel_tick_15 "alias pseudorandom_playermodel pseudorandom_playermodel_16;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_16"
alias pseudorandom_playermodel_tick_16 "alias pseudorandom_playermodel pseudorandom_playermodel_17;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_17"
alias pseudorandom_playermodel_tick_17 "alias pseudorandom_playermodel pseudorandom_playermodel_18;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_18"
alias pseudorandom_playermodel_tick_18 "alias pseudorandom_playermodel pseudorandom_playermodel_19;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_19"
alias pseudorandom_playermodel_tick_19 "alias pseudorandom_playermodel pseudorandom_playermodel_20;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_20"
alias pseudorandom_playermodel_tick_20 "alias pseudorandom_playermodel pseudorandom_playermodel_21;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_21"
alias pseudorandom_playermodel_tick_21 "alias pseudorandom_playermodel pseudorandom_playermodel_22;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_22"
alias pseudorandom_playermodel_tick_22 "alias pseudorandom_playermodel pseudorandom_playermodel_23;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_23"
alias pseudorandom_playermodel_tick_23 "alias pseudorandom_playermodel pseudorandom_playermodel_24;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_24"
alias pseudorandom_playermodel_tick_24 "alias pseudorandom_playermodel pseudorandom_playermodel_25;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_25"
alias pseudorandom_playermodel_tick_25 "alias pseudorandom_playermodel pseudorandom_playermodel_26;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_26"
alias pseudorandom_playermodel_tick_26 "alias pseudorandom_playermodel pseudorandom_playermodel_27;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_27"
alias pseudorandom_playermodel_tick_27 "alias pseudorandom_playermodel pseudorandom_playermodel_28;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_28"
alias pseudorandom_playermodel_tick_28 "alias pseudorandom_playermodel pseudorandom_playermodel_29;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_29"
alias pseudorandom_playermodel_tick_29 "alias pseudorandom_playermodel pseudorandom_playermodel_30;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_30"
alias pseudorandom_playermodel_tick_30 "alias pseudorandom_playermodel pseudorandom_playermodel_31;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_31"
alias pseudorandom_playermodel_tick_31 "alias pseudorandom_playermodel pseudorandom_playermodel_32;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_32"
alias pseudorandom_playermodel_tick_32 "alias pseudorandom_playermodel pseudorandom_playermodel_33;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_33"
alias pseudorandom_playermodel_tick_33 "alias pseudorandom_playermodel pseudorandom_playermodel_34;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_34"
alias pseudorandom_playermodel_tick_34 "alias pseudorandom_playermodel pseudorandom_playermodel_35;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_35"
alias pseudorandom_playermodel_tick_35 "alias pseudorandom_playermodel pseudorandom_playermodel_36;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_36"
alias pseudorandom_playermodel_tick_36 "alias pseudorandom_playermodel pseudorandom_playermodel_37;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_37"
alias pseudorandom_playermodel_tick_37 "alias pseudorandom_playermodel pseudorandom_playermodel_38;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_38"
alias pseudorandom_playermodel_tick_38 "alias pseudorandom_playermodel pseudorandom_playermodel_39;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_39"
alias pseudorandom_playermodel_tick_39 "alias pseudorandom_playermodel pseudorandom_playermodel_40;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_40"
alias pseudorandom_playermodel_tick_40 "alias pseudorandom_playermodel pseudorandom_playermodel_41;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_41"
alias pseudorandom_playermodel_tick_41 "alias pseudorandom_playermodel pseudorandom_playermodel_42;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_42"
alias pseudorandom_playermodel_tick_42 "alias pseudorandom_playermodel pseudorandom_playermodel_43;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_43"
alias pseudorandom_playermodel_tick_43 "alias pseudorandom_playermodel pseudorandom_playermodel_44;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_44"
alias pseudorandom_playermodel_tick_44 "alias pseudorandom_playermodel pseudorandom_playermodel_45;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_45"
alias pseudorandom_playermodel_tick_45 "alias pseudorandom_playermodel pseudorandom_playermodel_46;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_46"
alias pseudorandom_playermodel_tick_46 "alias pseudorandom_playermodel pseudorandom_playermodel_47;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_47"
alias pseudorandom_playermodel_tick_47 "alias pseudorandom_playermodel pseudorandom_playermodel_48;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_48"
alias pseudorandom_playermodel_tick_48 "alias pseudorandom_playermodel pseudorandom_playermodel_49;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_49"
alias pseudorandom_playermodel_tick_49 "alias pseudorandom_playermodel pseudorandom_playermodel_50;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_50"
alias pseudorandom_playermodel_tick_50 "alias pseudorandom_playermodel pseudorandom_playermodel_51;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_51"
alias pseudorandom_playermodel_tick_51 "alias pseudorandom_playermodel pseudorandom_playermodel_52;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_52"
alias pseudorandom_playermodel_tick_52 "alias pseudorandom_playermodel pseudorandom_playermodel_53;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_53"
alias pseudorandom_playermodel_tick_53 "alias pseudorandom_playermodel pseudorandom_playermodel_54;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_54"
alias pseudorandom_playermodel_tick_54 "alias pseudorandom_playermodel pseudorandom_playermodel_55;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_55"
alias pseudorandom_playermodel_tick_55 "alias pseudorandom_playermodel pseudorandom_playermodel_56;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_56"
alias pseudorandom_playermodel_tick_56 "alias pseudorandom_playermodel pseudorandom_playermodel_57;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_57"
alias pseudorandom_playermodel_tick_57 "alias pseudorandom_playermodel pseudorandom_playermodel_58;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_58"
alias pseudorandom_playermodel_tick_58 "alias pseudorandom_playermodel pseudorandom_playermodel_59;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_59"
alias pseudorandom_playermodel_tick_59 "alias pseudorandom_playermodel pseudorandom_playermodel_60;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_60"
alias pseudorandom_playermodel_tick_60 "alias pseudorandom_playermodel pseudorandom_playermodel_61;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_61"
alias pseudorandom_playermodel_tick_61 "alias pseudorandom_playermodel pseudorandom_playermodel_62;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_62"
alias pseudorandom_playermodel_tick_62 "alias pseudorandom_playermodel pseudorandom_playermodel_63;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_63"
alias pseudorandom_playermodel_tick_63 "alias pseudorandom_playermodel pseudorandom_playermodel_64;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_64"
alias pseudorandom_playermodel_tick_64 "alias pseudorandom_playermodel pseudorandom_playermodel_65;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_65"
alias pseudorandom_playermodel_tick_65 "alias pseudorandom_playermodel pseudorandom_playermodel_66;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_66"
alias pseudorandom_playermodel_tick_66 "alias pseudorandom_playermodel pseudorandom_playermodel_67;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_67"
alias pseudorandom_playermodel_tick_67 "alias pseudorandom_playermodel pseudorandom_playermodel_68;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_68"
alias pseudorandom_playermodel_tick_68 "alias pseudorandom_playermodel pseudorandom_playermodel_69;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_69"
alias pseudorandom_playermodel_tick_69 "alias pseudorandom_playermodel pseudorandom_playermodel_70;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_70"
alias pseudorandom_playermodel_tick_70 "alias pseudorandom_playermodel pseudorandom_playermodel_71;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_71"
alias pseudorandom_playermodel_tick_71 "alias pseudorandom_playermodel pseudorandom_playermodel_72;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_72"
alias pseudorandom_playermodel_tick_72 "alias pseudorandom_playermodel pseudorandom_playermodel_73;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_73"
alias pseudorandom_playermodel_tick_73 "alias pseudorandom_playermodel pseudorandom_playermodel_74;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_74"
alias pseudorandom_playermodel_tick_74 "alias pseudorandom_playermodel pseudorandom_playermodel_75;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_75"
alias pseudorandom_playermodel_tick_75 "alias pseudorandom_playermodel pseudorandom_playermodel_76;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_76"
alias pseudorandom_playermodel_tick_76 "alias pseudorandom_playermodel pseudorandom_playermodel_77;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_77"
alias pseudorandom_playermodel_tick_77 "alias pseudorandom_playermodel pseudorandom_playermodel_78;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_78"
alias pseudorandom_playermodel_tick_78 "alias pseudorandom_playermodel pseudorandom_playermodel_79;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_79"
alias pseudorandom_playermodel_tick_79 "alias pseudorandom_playermodel pseudorandom_playermodel_80;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_80"
alias pseudorandom_playermodel_tick_80 "alias pseudorandom_playermodel pseudorandom_playermodel_81;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_81"
alias pseudorandom_playermodel_tick_81 "alias pseudorandom_playermodel pseudorandom_playermodel_82;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_82"
alias pseudorandom_playermodel_tick_82 "alias pseudorandom_playermodel pseudorandom_playermodel_83;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_83"
alias pseudorandom_playermodel_tick_83 "alias pseudorandom_playermodel pseudorandom_playermodel_1;alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_1"


alias pseudorandom_playermodel pseudorandom_playermodel_1;
alias pseudorandom_playermodel_tick pseudorandom_playermodel_tick_1;

bind "w" "+forward; pseudorandom_playermodel_tick"
bind "space" "pseudorandom_playermodel"
```
This cycles through the increment of the playermodel list when "w" is pressed, and then will "select" the playermodel indexed when "Space" is pressed 
