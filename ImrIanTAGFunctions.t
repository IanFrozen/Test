function fTAGstart () : string
    var sstartgame : string
    put "Welcome to my TAG, you are in a somewhat medieval setting and your ultimate goal"
    put "is to defeat Lord Navaskithan. Before you can even face him however, you will"
    put "need to fight his minions in different biomes, buy better armour, equip stronger"
    put "weapons and maybe even go on a quest!"
    put ""
    delay (5000)
    put "Instructions: Every input should be a one word answer with all lowercase letters"
    put "If you input something that is invalid in that location, the game will ask you"
    put "to try again. You can sell any piece of equipment except biome gear and the"
    put "Superium sword. You can open your menu from your home or any central area"
    put "(ex. center of the arctic, town square, etc.). You can not equip a piece of gear"
    put "if you already have the same type of piece equipped. If your health ever goes to"
    put "or below 0 from a fight, you will be sent home and lose half your currency."
    put ""
    delay (5000)
    put "Once you have finished reading this, enter 'start' to begin your adventure!"
    loop
	get sstartgame
	if sstartgame = "start" then
	cls
	else
	    cls
	    put "Invalid input, remember to use one word, all lowercase responses."
	    put ""
	    put "Welcome to my TAG, you are in a somewhat medieval setting and your ultimate goal"
	    put "is to defeat Lord Navaskithan. Before you can even face him however, you will"
	    put "need to fight his minions in different biomes, buy better armour, equip stronger"
	    put "weapons and maybe even go on a quest!"
	    put ""
	    put "Instructions: Every input should be a one word answer with all lowercase letters"
	    put "If you input something that is invalid in that location, the game will ask you"
	    put "to try again. You can sell any piece of equipment except biome gear and the"
	    put "Superium sword. You can open your menu from your home or any central area"
	    put "(ex. center of the arctic, town square, etc.). You can not equip a piece of gear"
	    put "if you already have the same type of piece equipped. If your health ever goes to"
	    put "or below 0 from a fight, you will be sent home and lose half your currency." 
	    put ""
	    put "Once you have finished reading this, enter 'start' to begin your adventure!"
	end if
	exit when sstartgame = "start"
    end loop
    result ""
end fTAGstart
	
function fmenu (var itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings : int, bfrozenhelmet, bwastelandchestplate, bjungleleggings : boolean) : string
    var smenuinput : string
    loop
	put "Would you like to equip or unequip an item?"
	put "You must unequip an item to equip one of the same type."
	get smenuinput
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	if smenuinput = "equip" then
	    cls
	    put "You chose to ", smenuinput, " an item."
	    loop
		put "Would you like to equip a sword, helmet, chestplate or leggings?"
		get smenuinput
		cls
		put "Invalid input, remember to use one word, all lowercase responses."
		if smenuinput = "helmet" then
		    if ihelmet = 0 then
			cls
			put "You chose to equip a ", smenuinput
			loop
			    put "What helmet would you like to equip?"
			    get smenuinput
			    cls
			    put "Invalid input, remember to use one word, all lowercase responses."
			    if smenuinput = "iron" then
				if iironhelmet = 1 then
				    cls
				    put "You have equipped the iron helmet. (+ 10 health)"
				    itotalhealth := itotalhealth + 10
				    ihelmet := 1
				else
				    cls
				    put "You dont have the iron helmet to equip."
				    delay (2000)
				end if
			    else
				if smenuinput = "diamond" then
				    if idiamondhelmet = 1 then
					cls
					put "You have equipped the diamond helmet. (+ 25 health)"
					itotalhealth := itotalhealth + 25
					ihelmet := 2
				    else
					cls
					put "You dont have the diamond helmet to equip."
					delay (2000)
				    end if
				else
				    if smenuinput = "frozen" then
					if bfrozenhelmet = true then
					    cls
					    put "You have equipped the frozen helmet! (+ 40 health)"
					    itotalhealth := itotalhealth + 40
					    ihelmet := 3
					else
					    cls
					    put "You dont have the frozen helmet to equip."
					    delay (2000)
					end if
				    else
					if smenuinput = "exit" then
					    cls
					    put "You chose to exit the menu."
					else
					    smenuinput := "incorrect"
					end if
				    end if
				end if
			    end if
			    exit when smenuinput not= "incorrect"
			end loop
		    else
			put "You already have a helmet equipped, unequip it to equip a different one."
		    end if
		else
		    if smenuinput = "chestplate" then
			if ichestplate = 0 then
			    cls
			    put "You chose to equip a ", smenuinput
			    loop
				put "What chestpltate would you like to equip?"
				get smenuinput
				cls
				put "Invalid input, remember to use one word, all lowercase responses."
				if smenuinput = "iron" then
				    if iironchestplate = 1 then
					cls
					put "You have equipped the iron chestplate. (+ 10 health)"
					itotalhealth := itotalhealth + 10
					ichestplate := 1
				    else
					cls
					put "You dont have the iron chestplate to equip."
					delay (2000)
				    end if
				else
				    if smenuinput = "diamond" then
					if idiamondchestplate = 1 then
					    cls
					    put "You have equipped the diamond chestplate. (+ 25 health)"
					    itotalhealth := itotalhealth + 25
					    ichestplate := 2
					else
					    cls
					    put "You dont have the diamond chestplate to equip."
					    delay (2000)
					end if
				    else
					if smenuinput = "wasteland" then
					    if bwastelandchestplate = true then
						cls
						put "You have equipped the wasteland chestplate! (+ 40 health)"
						itotalhealth := itotalhealth + 40
						ichestplate := 3
					    else
						cls
						put "You dont have wasteland chestplate to equip."
						delay (2000)
					    end if
					else
					    if smenuinput = "exit" then
						cls
						put "You chose to exit the menu."
					    else
						smenuinput := "incorrect"
					    end if
					end if
				    end if
				end if
				exit when smenuinput not= "incorrect"
			    end loop
			else
			    put "You already have a chestplate equipped, unequip it to equip a different one."
			end if
		    else
			if smenuinput = "leggings" then
			    if ileggings = 0 then
				cls
				put "You chose to equip ", smenuinput
				loop
				    put "What leggings would you like to equip?"
				    get smenuinput
				    cls
				    put "Invalid input, remember to use one word, all lowercase responses."
				    if smenuinput = "iron" then
					if iironleggings = 1 then
					    cls
					    put "You have equipped the iron leggings. (+ 10 health)"
					    itotalhealth := itotalhealth + 10
					    ileggings := 1
					else
					    cls
					    put "You dont have the iron leggings to equip."
					    delay (2000)
					end if
				    else
					if smenuinput = "diamond" then
					    if idiamondleggings = 1 then
						cls
						put "You have equipped the diamond leggings. (+ 25 health)"
						itotalhealth := itotalhealth + 25
						ileggings := 2
					    else
						cls
						put "You dont have the diamond leggings to equip."
						delay (2000)
					    end if
					else
					    if smenuinput = "jungle" then
						if bjungleleggings = true then
						    cls
						    put "You have equipped the jungle leggings! (+ 40 health)"
						    itotalhealth := itotalhealth + 40
						    ileggings := 3
						else
						    cls
						    put "You dont have the jungle leggings to equip." 
						    delay (2000)
						end if
					    else
						if smenuinput = "exit" then
						    cls
						    put "You chose to exit the menu."
						else
						    smenuinput := "incorrect"
						end if
					    end if
					end if
				    end if
				    exit when smenuinput not= "incorrect"
				end loop
			    else
				put "You already have leggings equipped, unequip them to equip different ones."
			    end if
			else
			    if smenuinput = "sword" then
				if iweapon = 0 then
				    cls
				    put "You chose to equip a sword."
				    loop
					put "What sword would you like to equip?"
					get smenuinput
					cls
					put "Invalid input, remember to use one word, all lowercase responses."
					if smenuinput = "iron" then
					    if iironsword = 1 then
						cls
						put "You have equipped the iron sword. (10 - 15 damage per hit)"
						iweapon := 1
					    else
						cls
						put "You dont have the iron sword to equip."
						delay (2000)
					    end if
					else
					    if smenuinput = "diamond" then
						if idiamondsword = 1 then
						    cls
						    put "You have equipped the diamond sword. (12 - 18 damage per hit)"
						    iweapon := 2
						else
						    cls
						    put "You dont have the diamond sword to equip."
						    delay (2000)
						end if
					    else
						if smenuinput = "superium" then
						    if isuperiumsword = 1 then
							cls
							put "You have equipped the superium sword. (17 - 25 damage per hit)"
							iweapon := 3
						    end if
						else
						    if smenuinput = "exit" then
							cls
							put "You chose to exit the menu."
						    else
							smenuinput := "incorrect"
						    end if
						end if
					    end if
					end if
					exit when smenuinput not= "incorrect"
				    end loop
				else
				    put "You already have a sword equipped, unequip it to equip a different one."
				end if
			    else
				if smenuinput = "exit" then
				    cls
				    put "You chose to exit the menu."
				else
				    smenuinput := "incorrect"
				end if
			    end if
			end if
		    end if
		end if
		exit when smenuinput not= "incorrect"
	    end loop
	else
	    if smenuinput = "unequip" then
		cls
		put "You chose to ", smenuinput, " an item."
		loop
		    put "Would you like to unequip a sword, helmet, chestplate or leggings?"
		    get smenuinput
		    cls
		    put "Invalid input, remember to use one word, all lowercase responses."
		    if smenuinput = "helmet" then
			if ihelmet >= 1 then
			    cls
			    put "You chose to unequip a ", smenuinput
			    loop
				put "What helmet would you like to unequip?"
				get smenuinput
				cls
				put "Invalid input, remember to use one word, all lowercase responses."
				if smenuinput = "iron" then
				    if ihelmet = 1 then
					cls
					put "You have unequipped the iron helmet. (- 10 health)"
					itotalhealth := itotalhealth - 10
					ihelmet := 0
				    else
					cls
					put "You dont have the iron helmet to unequip."
					delay (2000)
				    end if
				else
				    if smenuinput = "diamond" then
					if ihelmet = 2 then
					    cls
					    put "You have unequipped the diamond helmet. (- 25 health)"
					    itotalhealth := itotalhealth - 25
					    ihelmet := 0
					else
					    cls
					    put "You dont have the diamond helmet to unequip."
					    delay (2000)
					end if
				    else
					if smenuinput = "frozen" then
					    if ihelmet = 3 then
						cls
						put "You have unequipped the frozen helmet. (- 35 health)"
						itotalhealth := itotalhealth - 35
						ihelmet := 0
					    else
						cls
						put "You dont have the frozen helmet to unequip."
						delay (2000)
					    end if
					else
					    if smenuinput = "exit" then
						cls
						put "You chose to exit the menu."
					    else
						smenuinput := "incorrect"
					    end if
					end if
				    end if
				end if
				exit when smenuinput not= "incorrect"
			    end loop
			else
			    put "You dont have any helmets equipped."
			end if
		    else
			if smenuinput = "chestplate" then
			    if ichestplate >= 1 then
				cls
				put "You chose to unequip a ", smenuinput
				loop
				    put "What chestplate would you like to unequip?"
				    get smenuinput
				    cls
				    put "Invalid input, remember to use one word, all lowercase responses."
				    if smenuinput = "iron" then
					if ichestplate = 1 then
					    cls
					    put "You have unequipped the iron chestplate. (- 10 health)"
					    itotalhealth := itotalhealth - 10
					    ichestplate := 0
					else
					    cls
					    put "You dont have the iron chestplate to unequip."
					    delay (2000)
					end if
				    else
					if smenuinput = "diamond" then
					    if ichestplate = 2 then
						cls
						put "You have unequipped the diamond chestplate. (- 25 health)"
						itotalhealth := itotalhealth - 25
						ichestplate := 0
					    else
						cls
						put "You dont have the diamond chestplate to unequip."
						delay (2000)
					    end if
					else
					    if smenuinput = "wasteland" then
						if ichestplate = 3 then
						    cls
						    put "You have unequipped the wasteland chestplate. (- 35 health)"
						    itotalhealth := itotalhealth - 35
						    ichestplate := 0
						else
						    cls
						    put "You dont have the wasteland chestplate to unequip."
						    delay (2000)
						end if
					    else
						if smenuinput = "exit" then
						    cls
						    put "You chose to exit the menu."
						else
						    smenuinput := "incorrect"
						end if
					    end if
					end if
				    end if
				    exit when smenuinput not= "incorrect"
				end loop
			    else
				put "You dont have any chesplates equipped."
			    end if
			else
			    if smenuinput = "leggings" then
				if ileggings >= 1 then
				    cls
				    put "You chose to unequip a ", smenuinput
				    loop
					put "What leggings would you like to unequip?"
					get smenuinput
					cls
					put "Invalid input, remember to use one word, all lowercase responses."
					if smenuinput = "iron" then
					    if ileggings = 1 then
						cls
						put "You have unequipped the iron leggings. (- 10 health)"
						itotalhealth := itotalhealth - 10
						ileggings := 0
					    else
						cls
						put "You dont have the iron leggings to unequip."
						delay (2000)
					    end if
					else
					    if smenuinput = "diamond" then
						if ileggings = 2 then
						    cls
						    put "You have unequipped the diamond leggings. (- 25 health)"
						    itotalhealth := itotalhealth - 25
						    ileggings := 0
						else
						    cls
						    put "You dont have the diamond leggings to unequip."
						    delay (2000)
						end if
					    else
						if smenuinput = "jungle" then
						    if ileggings = 3 then
							cls
							put "You have unequipped the jungle leggings. (- 35 health)"
							itotalhealth := itotalhealth - 35
							ileggings := 0
						    else
							cls
							put "You dont have the jungle leggings to unequip."
							delay (2000)
						    end if
						else
						    if smenuinput = "exit" then
							cls
							put "You chose to exit the menu."
						    else
							smenuinput := "incorrect"
						    end if
						end if
					    end if
					end if
					exit when smenuinput not= "incorrect"
				    end loop
				else
				    put "You dont have any leggings equipped."
				end if
			    else
				if smenuinput = "sword" then
				    if iweapon >= 1 then
					cls
					put "You chose to unequip a sword."
					loop
					    put "What sword would you like to unequip?"
					    get smenuinput
					    cls
					    put "Invalid input, remember to use one word, all lowercase responses."
					    if smenuinput = "iron" then
						if iweapon = 1 then
						    cls
						    put "You have unequipped the iron sword. (8 - 12 damage per hit)"
						    iweapon := 0
						else
						    cls
						    put "You dont have the iron sword to unequip."
						    delay (2000)
						end if
					    else
						if smenuinput = "diamond" then
						    if iweapon = 2 then
							cls
							put "You have unequipped the diamond sword. (12 - 18 damage per hit)"
							iweapon := 0
						    else
							cls
							put "You dont have the diamond sword to unequip."
							delay (2000)
						    end if
						else
						    if smenuinput = "superium" then
							if iweapon = 3 then
							    cls
							    put "You have unequipped the superium sword. (20 - 30 damage per hit)"
							    iweapon := 0
							else
							    cls
							    put "You dont have the superium sword to unequip."
							    delay (2000)
							end if
						    else
							if smenuinput = "exit" then
							    cls
							    put "You chose to exit the menu."
							else
							    smenuinput := "incorrect"
							end if
						    end if
						end if
					    end if
					    exit when smenuinput not= "incorrect"
					end loop
				    else
					put "You already have a sword equipped, unequip it to equip a different one."
				    end if
				else
				    if smenuinput = "exit" then
					cls
					put "You chose to exit the menu."
				    else
					smenuinput := "incorrect"
				    end if
				end if
			    end if
			end if
		    end if
		    exit when smenuinput not= "incorrect"
		end loop
	    else
		if smenuinput = "exit" then
		    cls
		    smenuinput := "backward"
		    put "You chose to exit the menu"
		else
		    smenuinput := "incorrect"
		end if
	    end if
	end if
	exit when smenuinput not= "incorrect"
    end loop
    result ""
end fmenu

function fcombat (var ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker : int) : string
    var scombatinput : string
    iendfight := 3
    ifleeattempt := 0
    ienemyhealth := 50

    if icombatdecider = 1 then
	put "You have entered an encounter with a sand monster!"
    else
	if icombatdecider = 2 then
	    put "You have entered an encounter with an ice golem!"
	else
	    if icombatdecider = 3 then
		put "You have entered an encounter with a wild animal!"
	    else
		if icombatdecider = 4 then
		    put "You have encountered the sand goliath!"
		    ienemyhealth := 225
		else
		    if icombatdecider = 5 then
			put "You have encountered the ice king!"
			ienemyhealth := 225
		    else
			if icombatdecider = 6 then
			    put "You have encountered the tiger emperor!"
			    ienemyhealth := 225
			else
			    if icombatdecider = 7 then
				put "Lord Navaskithan: 'WHO DARES ENTER MY LAIR! YOU, HUMAN WILL FEEL MY POWER FOR"
				put "DISTURBING ME!'"
				ienemyhealth := 500
			    end if
			end if
		    end if
		end if
	    end if
	end if
    end if
    loop
	loop
	    loop
		put "The enemy has ", ienemyhealth, " health remaining."
		put "You have ", icurrenthealth, " health remaining."
		put "Would you like to attack or attempt to flee?"
		get scombatinput
		cls
		put "Invalid input, remember to use one word, all lowercase responses."
		if scombatinput = "attack" then
		    if iweapon = 0 then
			cls
			randint (idamage, 8, 10)
			put "You attacked with your fists dealing ", idamage, " damage!"
			ienemyhealth := ienemyhealth - idamage
		    else
			if iweapon = 1 then
			    cls
			    randint (idamage, 10, 15)
			    put "You attacked with your iron sword dealing ", idamage, " damage!"
			    ienemyhealth := ienemyhealth - idamage
			else
			    if iweapon = 2 then
				cls
				randint (idamage, 12, 18)
				put "You attacked with your diamond sword dealing ", idamage, " damage!"
				ienemyhealth := ienemyhealth - idamage
			    else
				cls
				randint (idamage, 20, 30)
				put "You attacked with the superium sword dealing a massive ", idamage, " damage!!"
				ienemyhealth := ienemyhealth - idamage
			    end if
			end if
		    end if
		    if icombatdecider = 7 then
			randint (ienemydamage, 15, 20)
			put "Lord Navaskithan deals a strong ", ienemydamage, " damage to you!"
		    else
			randint (ienemydamage, 5, 15)
			put "The enemy attacked dealing ", ienemydamage, " damage to you."
		    end if
		    icurrenthealth := icurrenthealth - ienemydamage
		    if icurrenthealth <= 0 then
			iendfight := 1
		    else
			if ienemyhealth <= 0 then
			    iendfight := 2
			end if
		    end if
		end if
		exit when iendfight not= 0
	    end loop
	    if iendfight = 1 then
		put "You have been defeated by the enemy.... as a consequence, you have lost half"
		put "of your currency and have been sent back home."
		ifleeattempt := 1
	    else
		if iendfight = 2 then
		    put "You have defeated the enemy!"
		    if icombatdecider = 1 then
			isavannahmobtracker := isavannahmobtracker + 1
		    else
			if icombatdecider = 2 then
			    iarcticmobtracker := iarcticmobtracker + 1
			else
			    if icombatdecider = 3 then
				ijunglemobtracker := ijunglemobtracker + 1
			    end if
			end if
		    end if
		    ifleeattempt := 1
		end if
	    end if
	    if scombatinput = "flee" then
		if icombatdecider = 7 then
		    cls
		    put "You can not flee from Lord Navaskithan!"
		else
		    randint (ifleeattempt, 1, 5)
		    if ifleeattempt = 1 then
			cls
			put "You have successfully escaped the enemy!"
		    else
			cls
			put "Your flee attempt has failed!"
			randint (ienemydamage, 5, 15)
			put "The enemy attacked dealing ", ienemydamage, " damage to you."
			icurrenthealth := icurrenthealth - ienemydamage
			if icurrenthealth <= 0 then
			    iendfight := 1
			    put "You have been defeated by the enemy.... as a consequence, you have lost half"
			    put "of your currency and have been sent back home."
			    ifleeattempt := 1
			end if
		    end if
		end if
	    end if
	    exit when ifleeattempt = 1
	end loop
	if scombatinput = "attack" then
	else
	    if scombatinput = "flee" then
	    else
		scombatinput := "incorrect"
	    end if
	end if
	exit when scombatinput not= "incorrect"
    end loop
    result ""
end fcombat

function fhomeoptions (var smovement : string) : string
    loop
	put "You are at your home which means your health has been restored to full!"
	put "In front of you is the town of Otnorot. If you move backward you will be in the"
	put "savannah biome. To your left is the arctic biome and to your right is the jungle"
	put "biome. To the northeast, is the gate to Lord Navaskithan's lair."
	put "Enter either forward, backward, left or right to choose the way you want to go."
	put "Enter 'lair' to approach the gate to Lord Navaskithan's lair."
	put "Which way do you want to go?"
	get smovement
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if smovement = "forward" then
	    cls
	else
	    if smovement = "left" then
		cls
	    else
		if smovement = "right" then
		    cls
		else
		    if smovement = "backward" then
			cls
		    else
			if smovement = "menu" then
			    cls
			else
			    if smovement = "lair" then
				smovement := "towards Navaskithan's lair"
			    else
				smovement := "incorrect"
			    end if
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "incorrect"
    end loop
    put "You chose ", smovement, "."
    result ""
end fhomeoptions

function fsavannahoptions (var smovement : string) : string
    loop
	put "You have entered the Savannah biome. To your left is the Savannah merchant,"
	put "forward takes you deep into a sandstorm (enemy battles) and to your right is"
	put "the biome boss. Moving backward leads home."
	put "Which way do you want to go?"
	get smovement
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if smovement = "forward" then
	    cls
	    put "You chose to move ", smovement, "."
	else
	    if smovement = "left" then
		cls
		put "You chose to move ", smovement, "."
	    else
		if smovement = "right" then
		    cls
		    put "You chose to move ", smovement, "."
		    put "Mini Boss under construction"
		else
		    if smovement = "backward" then
			cls
			put "You chose to move ", smovement, "."
		    else
			if smovement = "menu" then
			    cls
			    put "You chose the menu."
			else
			    smovement := "incorrect"
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "incorrect"
    end loop
    result ""
end fsavannahoptions

function farcticoptions (var smovement : string) : string
    loop
	put "You have entered the Arctic biome. To your left is the Freezing merchant,"
	put "forward leads you into a blizzard and to your right is the biome boss."
	put "Moving backwards takes you home."
	put "Which way do you want to go?"
	get smovement
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if smovement = "forward" then
	    cls
	    put "You chose to move ", smovement, "."
	else
	    if smovement = "left" then
		cls
		put "You chose to move ", smovement, "."
	    else
		if smovement = "right" then
		    cls
		    put "You chose to move ", smovement, "."
		else
		    if smovement = "backward" then
			cls
			put "You chose to move ", smovement, "."
		    else
			if smovement = "menu" then
			    cls
			    put "You chose the menu."
			else
			    smovement := "incorrect"
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "incorrect"
    end loop
    result ""
end farcticoptions

function fjungleoptions (var smovement : string) : string
    loop
	put "You have entered the Jungle biome. To your left is the Wild merchant,"
	put "forward leads you into a series of vines and to your right is the biome boss."
	put "Moving backwards takes you home."
	put "Which way do you want to go?"
	get smovement
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if smovement = "forward" then
	    cls
	    put "You chose to move ", smovement, "."
	else
	    if smovement = "left" then
		cls
		put "You chose to move ", smovement, "."
	    else
		if smovement = "right" then
		    cls
		    put "You chose to move ", smovement, "."
		else
		    if smovement = "backward" then
			cls
			put "You chose to move ", smovement, "."
		    else
			if smovement = "menu" then
			    cls
			    put "You chose the menu."
			else
			    smovement := "incorrect"
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "incorrect"
    end loop
    result ""
end fjungleoptions

function ftownoptions (var smovement : string) : string
    loop
	put "You are in Otnorot town's square. Straight ahead is a woman buying and selling"
	put "armour To your left is the town mayor and to your right is a weaponsmith."
	put "Going backwards will lead you home."
	put "Which way do you want to go?"
	get smovement
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if smovement = "forward" then
	    cls
	    put "You chose to move ", smovement, "."
	else
	    if smovement = "left" then
		cls
		put "You chose to move ", smovement, "."
	    else
		if smovement = "right" then
		    cls
		    put "You chose to move ", smovement, "."
		else
		    if smovement = "backward" then
			cls
			put "You chose to move ", smovement, "."
		    else
			if smovement = "menu" then
			    cls
			    put "You chose the menu."
			else
			    smovement := "incorrect"
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "incorrect"
    end loop
    result ""
end ftownoptions

function farmourer (var icurrency, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iarmourerreset : int) : string
    var sarmourerinput, sequipment, sspecificitem : string
    loop
	put "Armourer: 'Welcome to my armour shop! I have the finest pieces in the town."
	put "Would you like to buy some armour or sell something you have?"
	get sarmourerinput
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if sarmourerinput = "buy" then
	    iarmourerreset := 0
	    cls
	    loop
		put "You chose to buy from the armourer."
		put "Armourer: 'What piece of gear would you like to buy, helmet, chestplate or"
		put "leggings?'"
		get sequipment
		cls
		put "Invalid input, remember to use one word, all lowercase responses."
		put ""
		if sequipment = "helmet" then
		    loop
			iarmourerreset := 0
			cls
			put "You chose to buy a ", sequipment
			put "Armourer: Would you like an iron helmet for $75 or a diamond helmet for $250?"
			get sspecificitem
			cls
			put "Invalid input, remember to use one word, all lowercase responses."
			put ""
			if sspecificitem = "iron" then
			    if iironhelmet = 0 then
				if icurrency >= 75 then
				    iironhelmet := 1
				    icurrency := icurrency - 75
				    cls
				    put "You have bought the iron helmet!"
				    put "Armourer: Thank you for shopping here."
				else
				    put "You dont have enough currency to buy that item."
				    delay (3000)
				    sspecificitem := "incorrect"
				end if
			    else
				cls
				put "You have already bought the iron helmet."
				delay (3000)
				sspecificitem := "incorrect"
			    end if
			else
			    if sspecificitem = "diamond" then
				if idiamondhelmet = 0 then
				    if icurrency >= 250 then
					idiamondhelmet := 1
					icurrency := icurrency - 250
					cls
					put "You have bought the diamond helmet!"
					put "Armourer: Thank you for shopping here."
				    else
					cls
					put "You dont have enough currency to buy that item."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    cls
				    put "You have already bought the diamond helmet."
				    delay (3000)
				    sspecificitem := "incorrect"
				end if
			    else
				if sspecificitem = "exit" then
				    cls
				    put "You have exitted the armour shop."
				    iarmourerreset := 1
				else
				    sspecificitem := "incorrect"
				end if
			    end if
			end if
			exit when sspecificitem not= "incorrect"
		    end loop
		else
		    if sequipment = "chestplate" then
			cls
			put "You chose to buy a ", sequipment
			loop
			    put "Armourer: Would you like to buy an iron chestplate for $75 or a diamond"
			    put "chestplate for $250?"
			    get sspecificitem
			    cls
			    put "Invalid input, remember to use one word, all lowercase responses."
			    put ""
			    if sspecificitem = "iron" then
				if iironchestplate = 0 then
				    if icurrency >= 75 then
					iironchestplate := 1
					icurrency := icurrency - 75
					cls
					put "You have bought the iron chestplate!"
					put "Armourer: Thank you for shopping here."
				    else
					cls
					put "You dont have enough currency to buy that item."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    cls
				    put "You have already bought the iron chestplate."
				    delay (3000)
				    sspecificitem := "incorrect"
				end if
			    else
				if sspecificitem = "diamond" then
				    if idiamondchestplate = 0 then
					if icurrency >= 250 then
					    idiamondchestplate := 1
					    icurrency := icurrency - 250
					    cls
					    put "You have bought the diamond chesptlate!"
					    put "Armourer: Thank you for shopping here."
					else
					    put "You dont have enough currency to buy that item."
					    delay (3000)
					    sspecificitem := "incorrect"
					end if
				    else
					cls
					put "You have already bought the diamond chestplate."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    if sspecificitem = "exit" then
					cls
					put "You have exitted the armour shop."
					iarmourerreset := 1
				    else
					sspecificitem := "incorrect"
				    end if
				end if
			    end if
			    exit when sspecificitem not= "incorrect"
			end loop
		    else
			if sequipment = "leggings" then
			    cls
			    put "You chose to buy a ", sequipment
			    loop
				put "Armourer: Would you like to buy iron leggings for $75 or diamond leggings for"
				put "$250?"
				get sspecificitem
				cls
				put "Invalid input, remember to use one word, all lowercase responses."
				put ""
				if sspecificitem = "iron" then
				    if iironleggings = 0 then
					if icurrency >= 75 then
					    iironleggings := 1
					    icurrency := icurrency - 75
					    cls
					    put "You have bought the iron leggings!"
					    put "Armourer: Thank you for shopping here."
					else
					    put "You dont have enough currency to buy that item."
					    delay (3000)
					    sspecificitem := "incorrect"
					end if
				    else
					cls
					put "You have already bought the iron leggings."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    if sspecificitem = "diamond" then
					if idiamondleggings = 0 then
					    if icurrency >= 250 then
						idiamondleggings := 1
						icurrency := icurrency - 250
						cls
						put "You have bought the diamond leggings!"
						put "Armourer: Thank you for shopping here."
					    else
						put "You dont have enough currency to buy that item."
						delay (3000)
						sspecificitem := "incorrect"
					    end if
					else
					    cls
					    put "You have already bought the diamond leggings."
					    delay (3000)
					    sspecificitem := "incorrect"
					end if
				    else
					if sspecificitem = "exit" then
					    cls
					    put "You have exitted the armour shop."
					    iarmourerreset := 1
					else
					    sspecificitem := "incorrect"
					end if
				    end if
				end if
				exit when sspecificitem not= "incorrect"
			    end loop
			else
			    if sequipment = "exit" then
				cls
				put "You have exitted the armour shop."
				iarmourerreset := 1
			    end if
			end if
		    end if
		end if
		exit when iarmourerreset = 1
	    end loop
	else
	    if sarmourerinput = "sell" then
		cls
		loop
		    iarmourerreset := 0
		    put "You chose to ", sarmourerinput, " to the armourer."
		    put "Armourer: 'What piece of gear would you like to sell, helmet, chestplate or"
		    put "leggings?'"
		    get sequipment
		    cls
		    put "Invalid input, remember to use one word, all lowercase responses."
		    put ""
		    if sequipment = "helmet" then
			cls
			put "You chose to sell a ", sequipment
			loop
			    cls
			    put "Armourer: Would you like to sell a iron helmet for $50 or a diamond helmet"
			    put "for $150?"
			    get sspecificitem
			    cls
			    put "Invalid input, remember to use one word, all lowercase responses."
			    put ""
			    if sspecificitem = "iron" then
				if iironhelmet = 1 then
				    iironhelmet := 0
				    icurrency := icurrency + 50
				    cls
				    put "You have sold the iron helmet!"
				    put "Armourer: Thank you for shopping here."
				else
				    cls
				    put "You dont have that item to sell."
				    delay (3000)
				    sspecificitem := "incorrect"
				end if
			    else
				if sspecificitem = "diamond" then
				    if idiamondhelmet = 1 then
					idiamondhelmet := 0
					icurrency := icurrency + 150
					cls
					put "You have sold the diamond helmet!"
					put "Armourer: Thank you for shopping here."
				    else
					cls
					put "You dont have that item to sell."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    if sspecificitem = "exit" then
					cls
					put "You have exitted the armour shop."
					iarmourerreset := 1
				    else
					sspecificitem := "incorrect"
				    end if
				end if
			    end if
			    exit when sspecificitem not= "incorrect"
			end loop
		    else
			if sequipment = "chestplate" then
			    cls
			    put "You chose to buy a ", sequipment
			    loop
				put "Armourer: Would you like to buy an iron chestplate for $75 or a diamond"
				put "chestplate for $250?"
				get sspecificitem
				cls
				put "Invalid input, remember to use one word, all lowercase responses."
				put ""
				if sspecificitem = "iron" then
				    if iironchestplate = 1 then
					iironchestplate := 0
					icurrency := icurrency + 50
					cls
					put "You have sold the iron chestplate!"
					put "Armourer: Thank you for shopping here."
				    else
					cls
					put "You dont have that item to sell."
					delay (3000)
					sspecificitem := "incorrect"
				    end if
				else
				    if sspecificitem = "diamond" then
					if idiamondchestplate = 1 then
					    idiamondchestplate := 0
					    icurrency := icurrency + 150
					    cls
					    put "You have sold the diamond chesptlate!"
					    put "Armourer: Thank you for shopping here."
					else
					    cls
					    put "You dont have that item to sell."
					    delay (3000)
					    sspecificitem := "incorrect"
					end if
				    else
					if sspecificitem = "exit" then
					    cls
					    put "You have exitted the armour shop."
					    iarmourerreset := 1
					else
					    sspecificitem := "incorrect"
					end if
				    end if
				end if
				exit when sspecificitem not= "incorrect"
			    end loop
			else
			    if sequipment = "leggings" then
				cls
				put "You chose to buy a ", sequipment
				loop
				    put "Armourer: Would you like to buy iron leggings for $75 or diamond leggings for"
				    put "$250?"
				    get sspecificitem
				    cls
				    put "Invalid input, remember to use one word, all lowercase responses."
				    put ""
				    if sspecificitem = "iron" then
					if iironleggings = 1 then
					    iironleggings := 0
					    icurrency := icurrency + 50
					    cls
					    put "You have sold the iron leggings!"
					    put "Armourer: Thank you for shopping here."
					else
					    cls
					    put "You dont have that item to sell."
					    delay (3000)
					    sspecificitem := "incorrect"
					end if
				    else
					if sspecificitem = "diamond" then
					    if idiamondleggings = 1 then
						idiamondleggings := 0
						icurrency := icurrency - 250
						cls
						put "You have sold the diamond leggings!"
						put "Armourer: Thank you for shopping here."
					    else
						cls
						put "You dont have that item to sell."
						delay (3000)
						sspecificitem := "incorrect"
					    end if
					else
					    if sspecificitem = "exit" then
						cls
						put "You have exitted the armour shop."
						iarmourerreset := 1
					    else
						sspecificitem := "incorrect"
					    end if
					end if
				    end if
				    exit when sspecificitem not= "incorrect"
				end loop
			    else
				if sequipment = "exit" then
				    cls
				    put "You have exitted the armour shop."
				    iarmourerreset := 1
				end if
			    end if
			end if
		    end if
		    exit when iarmourerreset = 1
		end loop
	    else
		if sarmourerinput = "exit" then
		    cls
		    put "You exitted the armour shop."
		else
		    sarmourerinput := "incorrect"
		end if
	    end if
	end if
	exit when sarmourerinput not= "incorrect"
    end loop
    result ""
end farmourer

function fmayor (var iquesttracker, isandloot, ijungleloot, iarcticloot, isuperiumsword : int) : string
    var smayorinput : string
    smayorinput := "yes"
    loop
	if iquesttracker = 0 then
	    put "Mayor: 'Hello there, traveler! I hope you enjoy our little town, everyone has" 
	    put "been on edge since Lord Navaskithan started causing all of this trouble for us."
	    put "Actually, you look like the perfect person for a dangerous mission of mine!"
	    put "The weaponsmith has informed me that he may be able to make the most powerful"
	    put "sword yet known as the superium sword. With this weapon and the proper wielder,"
	    put "we may stand a chance at defeating Lord Navaskithan! To prove you are worthy of"
	    put "this sword, bring me some resources from some enemies across the different"
	    put "biomes and the sword will be yours.'"
	    put "Will you accept or decline the quest?"
	    get smayorinput
	    cls
	    put "Invalid input, remember to use one word, all lowercase responses."
	    put ""
	    if smayorinput = "accept" then
		cls
		iquesttracker := 1
		put "Mayor: 'Alright then, you will need to bring me 25 sand gems, 20 magic bananas" 
		put "and 15 subzero gems. Good Luck and take as long as you need!"
	    else
		if smayorinput = "decline" then
		    cls
		    put "Mayor: Very well, but if you ever change your mind, come and talk to me."
		    delay (2000)
		else
		    smayorinput := "incorrect"
		end if
	    end if
	else
	    if iquesttracker = 1 then
		if isandloot >= 1 then
		    if iarcticloot >= 1 then
			if ijungleloot >= 1 then
			    isandloot := isandloot - 1
			    iarcticloot := iarcticloot - 1
			    ijungleloot := ijungleloot - 1
			    put "Mayor: 'Thank you so much traveler for your valiant efforts!"
			    put "Here is the Superium sword as promised."
			    isuperiumsword := 1
			    iquesttracker := 2
			    smayorinput := "yes"
			else
			    put "You have not obtained all items to complete the quest."
			    smayorinput := "yes"
			end if
		    end if
		end if
	    else
		if iquesttracker = 2 then
		    put "You have already completed the mayor's quest."
		    delay (3000)
		    smayorinput := "yes"
		end if
	    end if
	end if
	exit when smayorinput not= "incorrect"
    end loop
    result ""
end fmayor

function fweaponsmith (var icurrency, iironsword, idiamondsword : int) : string
    var sweaponsmithinput : string
    loop
	put "Weaponsmith: 'Hey there! I am Otnorot's weaponsmith. If you need an ugraded" 
	put "weapon, I'm the guy to get it from.'"
	put "Would you like to buy or sell a sword?"
	get sweaponsmithinput
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if sweaponsmithinput = "buy" then
	    cls
	    put "You chose to buy from the weaponsmith."
	    loop
		put "Weaponsmith: 'Would you like an iron sword for $100 or a diamond sword for"
		put "$250?'"
		get sweaponsmithinput
		cls
		put "Invalid input, remember to use one word, all lowercase responses."
		put ""
		if sweaponsmithinput = "iron" then
		    if iironsword = 0 then
			if icurrency >= 100 then
			    iironsword := 1
			    icurrency := icurrency - 100
			    cls
			    put "You have bought the iron sword!"
			    put "Weaponsmith: 'Thank you for shopping here.'"
			else
			    put "You dont have enough currency to buy that item."
			    delay (3000)
			    sweaponsmithinput := "incorrect"
			end if
		    else
			cls
			put "You have already bought the iron sword."
			delay (3000)
			sweaponsmithinput := "incorrect"
		    end if
		else
		    if sweaponsmithinput = "diamond" then
			if idiamondsword = 0 then
			    if icurrency >= 250 then
				idiamondsword := 1
				icurrency := icurrency - 250
				cls
				put "You have bought the diamond sword!"
				put "Armourer: Thank you for shopping here."
			    else
				cls
				put "You dont have enough currency to buy that item."
				delay (3000)
				sweaponsmithinput := "incorrect"
			    end if
			else
			    cls
			    put "You have already bought the iron helmet."
			    delay (3000)
			    sweaponsmithinput := "incorrect"
			end if
		    else
			if sweaponsmithinput = "exit" then
			    cls
			    put "You have exitted the armour shop."
			else
			    sweaponsmithinput := "incorrect"
			end if
		    end if
		end if
		exit when sweaponsmithinput not= "incorrect"
	    end loop
	else
	    if sweaponsmithinput = "sell" then
		cls
		put "You chose to ", sweaponsmithinput, " to the weaponsmith."
		loop
		    put "Weaponsmith: 'Would you like to sell an iron sword for $75 or a diamond sword"
		    put "for $200?"
		    get sweaponsmithinput
		    cls
		    put "Invalid input, remember to use one word, all lowercase responses."
		    put ""
		    if sweaponsmithinput = "iron" then
			if iironsword = 1 then
			    iironsword := 0
			    icurrency := icurrency + 75
			    cls
			    put "You have sold the iron sword!"
			    put "Weaponsmith: 'Thank you for shopping here.'"
			else
			    cls
			    put "You don't have the iron sword to sell."
			    delay (3000)
			    sweaponsmithinput := "incorrect"
			end if
		    else
			if sweaponsmithinput = "diamond" then
			    if idiamondsword = 1 then
				idiamondsword := 0
				icurrency := icurrency + 200
				cls
				put "You have sold the diamond sword!"
				put "Weaponsmith: 'Thank you for shopping here.'"
			    else
				cls
				put "You don't have the diamond sword to sell."
				delay (3000)
				sweaponsmithinput := "incorrect"
			    end if
			else
			    if sweaponsmithinput = "exit" then
				cls
				put "You chose to exit the weaponsmith shop."
			    else
				sweaponsmithinput := "incorrect"
			    end if
			end if
		    end if
		    exit when sweaponsmithinput not= "incorrect"
		end loop
	    else
		sweaponsmithinput := "incorrect"
	    end if
	end if
	exit when sweaponsmithinput not= "incorrect"
    end loop
    result ""
end fweaponsmith

function fbiomevendors (var bmoneycheck, bbuycheck, bsavannahvendor, barcticvendor, bjunglevendor, bfrozenhelmet, bwastelandchestplate, bjungleleggings : boolean) : string
    var svendorinput : string
    var bvendorexit : boolean
    bvendorexit := true
    bbuycheck := false
    loop
	get svendorinput
	cls
	put "Invalid input, remember to use one word, all lowercase responses."
	put ""
	if svendorinput = "buy" then
	    if bsavannahvendor = true then
		if bwastelandchestplate = false then
		    if bmoneycheck = true then
			bbuycheck := true
			bwastelandchestplate := true
			cls
			put "You bought the wasteland chestplate!"
			put "Vendor: 'Thanks for the purchase. if you haven't already, stop by my brothers," 
			put "they sell armour just like mine!'"
			delay (4000)
		    else
			cls
			put "You don't have enough money to buy that item."
			delay (3000)
		    end if
		else
		    cls
		    put "You have already bought the wasteland chestplate."
		    delay (2000)
		end if
	    else
		if barcticvendor = true then
		    if bfrozenhelmet = false then
			if bmoneycheck = true then
			    bbuycheck := true
			    bfrozenhelmet := true
			    cls
			    put "You bought the frozen helmet!"
			    put "Vendor: 'Thanks for the purchase. if you haven't already, stop by my brothers,"
			    put "they sell armour just like mine!'"
			    delay (4000)
			else
			    cls
			    put "You don't have enough money to buy that item."
			    delay (3000)
			end if
		    else
			cls
			put "You have already bought the frozen helmet."
			delay (2000)
		    end if
		else
		    if bjunglevendor = true then
			if bjungleleggings = false then
			    if bmoneycheck = true then
				bbuycheck := true
				bjungleleggings := true
				cls
				put "You bought the jungle leggings!"
				put "Vendor: 'Thanks for the purchase. if you haven't already, stop by my"
				put "brothers they sell armour just like mine!'"
				delay (4000)
			    else
				cls
				put "You don't have enough money to buy that item."
				delay (3000)
			    end if
			else
			    cls
			    put "You have already bought the jungle leggings."
			    delay (2000)
			end if
		    end if
		end if
	    end if
	else
	    if svendorinput = "exit" then
		cls
		put "You chose to exit the vendor's shop."
	    else
		bvendorexit := false
	    end if
	end if
	exit when bvendorexit = true
    end loop
    result ""
end fbiomevendors

