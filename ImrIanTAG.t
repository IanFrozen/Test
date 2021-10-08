% Hello Mr. Sze, 
% To start, I wanted to say thank you for giving me extra time to work on this project, it was much apprecitated. I ran into two issues that I wanted to
% address to you. The first one was about boolean variables. I know that there are some integer variables that could be boolean since they are only using
% 1 or 0 in the menu, armourer, mayor and weaponsmith functions. However when I tried changing these to it would display a strange error message that I
% did not get encounter with my other boolean variables so I decided to just leave them as integers so I would still have a working game. The second issue
% I found was regarding indentation. Not long after the winter break began, whenever I tried to indent my file (using both F2 and the Indent button) it
% gave me an error saying 'Not enough memory to indent file'. I had no choice but to manually indent it from then on so if there is any indentation
% mistakes, it's not because I just forgot to hit the button. Thank you once again for the extra time to work on this. 
%                                                                                                                               Sincerely, Ian

include "ImrIanTAGFunctions.t"

var smovement, stownexit, smayorinput, sweaponsmithinput, smenuinput, ssavannahexit, sarcticexit, sjungleexit, scombatinput, sbossstarter : string
var ifightmoney, isandloot, ijungleloot, iarcticloot, ideathcounter, iquesttracker, icurrenthealth, itotalhealth, idamage, icurrency, iironsword, idiamondsword, isuperiumsword, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iarmourerreset, ienemyhealth, ienemydamage, iendfight, ifleeattempt, iweapon, ihelmet, ichestplate, ileggings, icombatdecider, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker : int
var bdeathcheck, bsavannahvendor, barcticvendor, bjunglevendor, bfrozenhelmet, bwastelandchestplate, bjungleleggings, bbuycheck, bmoneycheck, barctickey, bsavannahkey, bjunglekey, blairexit: boolean 

icurrenthealth := 100
itotalhealth := 100
icurrency := 100
ideathcounter := 0
iquesttracker := 0
iweapon := 0
isandloot := 0
ijungleloot := 0
iarcticloot := 0
iironhelmet := 0
iironchestplate := 0
iironleggings := 0
idiamondleggings := 0
idiamondhelmet := 0
idiamondchestplate := 0
iironsword := 0
idiamondsword := 0
isuperiumsword := 0
bfrozenhelmet := false
bwastelandchestplate := false
bjungleleggings := false
iweapon := 0
ihelmet := 0
ichestplate := 0
ileggings := 0
isavannahmobtracker := 0
iarcticmobtracker := 0
ijunglemobtracker := 0
bsavannahkey := false
barctickey := false
bjunglekey := false
bsavannahvendor := false
barcticvendor := false
bjunglevendor := false

put fTAGstart ()
loop
    loop
	if icurrenthealth <= 0 then
	    ideathcounter := ideathcounter + 1
	    icurrency := icurrency div 2
	end if
	bdeathcheck := false
	icurrenthealth := itotalhealth
	icombatdecider := 0
	stownexit := "no"
	ssavannahexit := "no"
	sarcticexit := "no"
	sjungleexit := "no"
	blairexit := false
	put fhomeoptions (smovement)
	if smovement = "forward" then
	    loop
		exit when stownexit = "yes"
		stownexit := "yes"
		put ftownoptions (smovement)
		if smovement = "forward" then
		    stownexit := "no"
		    put farmourer (icurrency, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iarmourerreset)
		end if
		if smovement = "left" then
		    stownexit := "no"
		    put fmayor (iquesttracker, isandloot, ijungleloot, iarcticloot, isuperiumsword)
		end if
		if smovement = "right" then
		    stownexit := "no"
		    put fweaponsmith (icurrency, iironsword, idiamondsword)
		end if
		if smovement = "menu" then
		    put "Your health is at ", icurrenthealth, " / ", itotalhealth
		    put "You have $", icurrency, ", ", isandloot, " sand gems, ", ijungleloot, " magic bananas, and ", iarcticloot, " subzero shards"
		    stownexit := "no"
		    put fmenu (itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
		end if
	    end loop
	else
	    if smovement = "backward" then
		loop
		    exit when ssavannahexit = "yes"
		    ssavannahexit := "yes"
		    icombatdecider := 1
		    put fsavannahoptions (smovement)
		    if smovement = "menu" then
			put "Your health is at ", icurrenthealth, " / ", itotalhealth
			put "You have $", icurrency, ", ", isandloot, " sand gems, ", ijungleloot, " magic bananas, and ", iarcticloot, " subzero shards"
			ssavannahexit := "no"
			put fmenu (itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
		    else
			if smovement = "forward" then
			    ssavannahexit := "no"
			    put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
			    if icurrenthealth <= 0 then
				ssavannahexit := "yes"
				bdeathcheck := true
			    else
				randint (isandloot, 1, 4)
				randint (ifightmoney, 5, 10)
				put "From that fight, you obtained ", isandloot, " sand gems and $", ifightmoney, "."
				icurrency := icurrency + ifightmoney
			    end if
			else
			    if smovement = "right" then
				ssavannahexit := "no"
				icombatdecider := 5
				if bsavannahkey = false then
				    if isavannahmobtracker >= 10 then
					put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
					if icurrenthealth <= 0 then
					    ssavannahexit := "yes"
					    bdeathcheck := true
					else
					    if ienemyhealth <= 0 then
						put "You have defeated the sand goliath and have obtained his tooth! You will need this as well as two other items to open Lord Navaskithan."
						bsavannahkey := true
					    end if
					end if
				    else
					put "This way is unavailable for now, try defeating more mobs in this area..."
					delay (3000)
				    end if
				else
				    put "You have already defeated the sand goliath! There's nothing to do here."
				    delay (3000)
				end if
			    else
				if smovement = "left" then
				    ssavannahexit := "no"
				    bmoneycheck := false
				    bsavannahvendor := false
				    barcticvendor := false
				    bjunglevendor := false
				    if icurrency >= 325 then
					bmoneycheck := true
				    end if
				    if icombatdecider = 1 then
					bsavannahvendor := true
					put "Vendor: 'Hey there! I am the savannah vendor selling the armour piece specific to this biome."
					put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
					put "Anyways, would you like to buy the chestplate that I'm selling for $325?"
				    else
					barcticvendor := true
					if icombatdecider = 2 then
					    put "Vendor: 'Hey there! I am the arctic vendor selling the armour piece specific to this biome."
					    put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
					    put "Anyways, would you like to buy the helmet that I'm selling for $325?"
					else
					    bjunglevendor := true
					    put "Vendor: 'Hey there! I am the jungle vendor selling the armour piece specific to this biome."
					    put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
					    put "Anyways, would you like to buy the jungle that I'm selling for $325?"
					end if
				    end if
				    put fbiomevendors (bmoneycheck, bbuycheck, bsavannahvendor, barcticvendor, bjunglevendor, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
				    if bbuycheck = true then
					icurrency := icurrency - 325
				    end if
				end if
			    end if
			end if
		    end if
		end loop
	    else
		if smovement = "left" then
		    loop
			exit when sarcticexit = "yes"
			sarcticexit := "yes"
			icombatdecider := 2
			put farcticoptions (smovement)
			if smovement = "menu" then
			    put "Your health is at ", icurrenthealth, " / ", itotalhealth
			    put "You have $", icurrency, ", ", isandloot, " sand gems, ", ijungleloot, " magic bananas, and ", iarcticloot, " subzero shards"
			    sarcticexit := "no"
			    put fmenu (itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
			else
			    if smovement = "forward" then
				sarcticexit := "no"
				put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
				if icurrenthealth <= 0 then
				    sarcticexit := "yes"
				    bdeathcheck := true
				else
				    randint (iarcticloot, 1, 4)
				    randint (ifightmoney, 5, 10)
				    put "From that fight, you obtained ", iarcticloot, " subzero shards and $", ifightmoney, "."
				    icurrency := icurrency + ifightmoney
				end if
			    else
				if smovement = "right" then
				    sarcticexit := "no"
				    icombatdecider := 5
				    if barctickey = false then
					if iarcticmobtracker >= 10 then
					    put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
					    if icurrenthealth <= 0 then
						sarcticexit := "yes"
						bdeathcheck := true
					    else
						if ienemyhealth <= 0 then
						    put "You have defeated the ice king and have obtained his crown! You will need this as well as two other items to open Lord Navaskithan."
						    barctickey := true
						end if
					    end if
					else
					    put "This way is unavailable for now, try defeating more mobs in this area..."
					    delay (3000)
					end if
				    else
					put "You have already defeated the ice king! There's nothing to do here."
					delay (3000)
				    end if
				else
				    if smovement = "left" then
					sarcticexit := "no"
					bmoneycheck := false
					bsavannahvendor := false
					barcticvendor := false
					bjunglevendor := false
					if icurrency >= 325 then
					    bmoneycheck := true
					end if
					if icombatdecider = 1 then
					    bsavannahvendor := true
					    put "Vendor: 'Hey there! I am the savannah vendor selling the armour piece specific to this biome."
					    put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
					    put "Anyways, would you like to buy the chestplate that I'm selling for $325?"
					else
					    barcticvendor := true
					    if icombatdecider = 2 then
						put "Vendor: 'Hey there! I am the arctic vendor selling the armour piece specific to this biome."
						put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
						put "Anyways, would you like to buy the helmet that I'm selling for $325?"
					    else
						bjunglevendor := true
						put "Vendor: 'Hey there! I am the jungle vendor selling the armour piece specific to this biome."
						put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
						put "Anyways, would you like to buy the jungle that I'm selling for $325?"
					    end if
					end if
					put fbiomevendors (bmoneycheck, bbuycheck, bsavannahvendor, barcticvendor, bjunglevendor, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
					if bbuycheck = true then
					    icurrency := icurrency - 325
					end if
				    end if
				end if
			    end if
			end if
		    end loop
		else
		    if smovement = "right" then
			loop
			    exit when sjungleexit = "yes"
			    sjungleexit := "yes"
			    icombatdecider := 3
			    put fjungleoptions (smovement)
			    if smovement = "menu" then
				put "Your health is at ", icurrenthealth, " / ", itotalhealth
				put "You have $", icurrency, ", ", isandloot, " sand gems, ", ijungleloot, " magic bananas, and ", iarcticloot, " subzero shards"
				sjungleexit := "no"
				put fmenu (itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
			    else
				if smovement = "forward" then
				    sjungleexit := "no"
				    put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
				    if icurrenthealth <= 0 then
					sjungleexit := "yes"
					bdeathcheck := true
				    else
					randint (ijungleloot, 1, 4)
					randint (ifightmoney, 5, 10)
					put "From that fight, you obtained ", ijungleloot, " magic bananas and $", ifightmoney, "."
					icurrency := icurrency + ifightmoney
				    end if
				else
				    if smovement = "right" then
					sjungleexit := "no"
					icombatdecider := 6
					if barctickey = false then
					    if ijunglemobtracker >= 10 then
						put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
						if icurrenthealth <= 0 then
						    sjungleexit := "yes"
						    bdeathcheck := true
						else
						    if ienemyhealth <= 0 then
							put "You have defeated the tiger emperor and have obtained his piercing eye! You will need this as well as two other items to open Lord Navaskithan."
							bjunglekey := true
						    end if
						end if
					    else
						put "This way is unavailable for now, try defeating more mobs in this area..."
						delay (3000)
					    end if
					else
					    put "You have already defeated the tiger emperor! There's nothing to do here."
					    delay (3000)
					end if
				    else
					if smovement = "left" then
					    sjungleexit := "no"
					    bmoneycheck := false
					    bsavannahvendor := false
					    barcticvendor := false
					    bjunglevendor := false
					    if icurrency >= 325 then
						bmoneycheck := true
					    end if
					    if icombatdecider = 1 then
						bsavannahvendor := true
						put "Vendor: 'Hey there! I am the savannah vendor selling the armour piece specific to this biome."
						put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
						put "Anyways, would you like to buy the chestplate that I'm selling for $325?"
					    else
						if icombatdecider = 2 then
						    barcticvendor := true
						    put "Vendor: 'Hey there! I am the arctic vendor selling the armour piece specific to this biome."
						    put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
						    put "Anyways, would you like to buy the helmet that I'm selling for $325?"
						else
						    bjunglevendor := true
						    put "Vendor: 'Hey there! I am the jungle vendor selling the armour piece specific to this biome."
						    put "You may have seen my two brothers in the other biomes. I haven't really had any visitors since Lord Navaskithan started all this chaos!"
						    put "Anyways, would you like to buy the jungle that I'm selling for $325?"
						end if
					    end if
					    put fbiomevendors (bmoneycheck, bbuycheck, bsavannahvendor, barcticvendor, bjunglevendor, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
					    if bbuycheck = true then
						icurrency := icurrency - 325
					    end if
					end if
				    end if
				end if
			    end if
			end loop
		    else
			if smovement = "menu" then
			    put "Your health is at ", icurrenthealth, " / ", itotalhealth
			    put "You have $", icurrency, ", ", isandloot, " sand gems, ", ijungleloot, " magic bananas, and ", iarcticloot, " subzero shards"
			    put fmenu (itotalhealth, iironhelmet, idiamondhelmet, iironchestplate, idiamondchestplate, iironleggings, idiamondleggings, iironsword, idiamondsword, isuperiumsword, iweapon, ihelmet, ichestplate, ileggings, bfrozenhelmet, bwastelandchestplate, bjungleleggings)
			    smovement := "backward"
			else
			    cls
			    loop
				loop
				    blairexit := true
				    if bsavannahkey = true then
					if barctickey = true then
					    if bjunglekey = true then
						put "You are about to begin a fight with Lord Navaskithan, you will not be able to flee from this battle."
						put "This is no easy task. Do you accept or decline the dangers?"
						get sbossstarter
						cls
						put "Invalid input, remember to use one word, all lowercase responses."
						if sbossstarter = "accept" then
						    icombatdecider := 7
						    cls
						    put "Ok... dont say i didnt warn you!"
						    delay (5000)
						    put fcombat (ideathcounter, icombatdecider, icurrenthealth, ienemyhealth, iweapon, idamage, ienemydamage, iendfight, ifleeattempt, isavannahmobtracker, iarcticmobtracker, ijunglemobtracker)
						    if icurrenthealth <= 0 then
							bdeathcheck := true
						    else
							put "Lord Navaskithan: 'Is this true, have I actually been defeated... by a human..? Maybe *cough* I was wrong after all....'"
							put "Congratulations! You have completed my TAG! I hope you enjoyed. Play again anytime :)"
							put "T"
							delay (1000)
							put "Y"
							delay (1000)
							put "F"
							delay (1000)
							put "U"
							delay (1000)
							put "M"
							delay (1000)
							put "P"
						    end if
						else
						    if sbossstarter = "decline" then
							cls
							put "Coward :("
							delay (2000)
							smovement := "backward"
						    else
							sbossstarter := "incorrect"
							blairexit := false
						    end if
						end if
					    else
						put "You have not collected the 3 keys needed to unlock Lord Navaskithan's Lair"
						put "There is one key in each biome. Collect them to unlock this."
						put ""
						delay (5000)
						sbossstarter := "correct"
						smovement :=  "backward"
					    end if
					else
					    put "You have not collected the 3 keys needed to unlock Lord Navaskithan's Lair"
					    put "There is one key in each biome. Collect them to unlock this."
					    put ""
					    delay (5000)
					    sbossstarter := "correct"
					    smovement :=  "backward"
					end if
				    else
					put "You have not collected the 3 keys needed to unlock Lord Navaskithan's Lair"
					put "There is one key in each biome. Collect them to unlock this."
					put ""
					delay (5000)
					sbossstarter := "correct"
					smovement :=  "backward"
				    end if
				    exit when blairexit = true
				end loop
				exit when sbossstarter not= "incorrect"
			    end loop
			end if
		    end if
		end if
	    end if
	end if
	exit when smovement not= "backward"
    end loop
    exit when bdeathcheck not= true
end loop
