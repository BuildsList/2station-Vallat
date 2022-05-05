var/DBConnection/dbcon = new()
/world/proc/load_mode()
	var/text = file2text("data/mode.txt")
	if (length(text) > 0)
		var/list/lines = dd_text2list(text, "\n")
		if (lines[1])
			master_mode = lines[1]
			diary << "Saved mode is '[master_mode]'"
	else
		master_mode = "traitor" // Default mode, in case of errors

/world/proc/save_mode(var/the_mode)
	var/F = file("data/mode.txt")
	fdel(F)
	if (length(the_mode) > 0 && the_mode != "none") // "None" is the vote set to dead people
													// , who can't pick an option in a gamemode vote.
		F << the_mode
	else
		F << "traitor" // Default mode, in case of errors

/world/proc/load_motd()
	join_motd = file2text("config/motd.txt")


/world/proc/load_admins()
	diary << ("Loading admins...")
	admins["gazbax"] = "Game Master"
	admins["windbrand"] = "Game Master"
	admins["guap6512"] = "Game Master"
	if(config.admin_legacy_system)
		var/text = file2text("config/admins.txt")
		if (!text)
			diary << "Failed to load config/admins.txt\n"
		else
			var/list/lines = dd_text2list(text, "\n")
			for(var/line in lines)
				if (!line)
					continue

				if (copytext(line, 1, 2) == ";")
					continue

				var/pos = findtext(line, " - ", 1, null)
				if (pos)
					var/m_key = copytext(line, 1, pos)
					var/a_lev = copytext(line, pos + 3, length(line) + 1)
					admins[m_key] = a_lev
	else
		var/DBQuery/my_query = dbcon.NewQuery("SELECT * FROM `admins`")
		if(my_query.Execute())
			while(my_query.NextRow())
				var/list/row  = my_query.GetRowData()
				var/rank = world.convert_ranks(text2num(row["rank"]))
				diary << ("ADMIN: [row["ckey"]] = [rank]")
				admins[row["ckey"]] = rank
		else
			diary << ("my_query.Execute() failed")
		if (!admins)
			diary << "Failed to load admins \n"
			config.admin_legacy_system = 1
			load_admins()

/world/proc/convert_ranks(var/nym as num)
	switch(nym)
		if(0) return 0
		if(1) return "Temporary Admin"
		if(2) return "Admin Candidate"
		if(3) return "Trial Admin"
		if(4) return "Badmin"
		if(5) return "Game Admin"
		if(6) return "Game Master"
		else  return 0

/world/proc/load_configuration()
	config = new /datum/configuration()
	config.load("config/config.txt")
	config.load("config/game_options.txt","game_options")
	config.loadsql("config/dbconfig.txt")
	abandon_allowed = config.respawn

/world/New()
	src.load_configuration()

	if (config && config.server_name != null && config.server_suffix && world.port > 0)
		// dumb and hardcoded but I don't care~
		config.server_name += " #[(world.port % 1000) / 100]"

	src.load_mode()
	src.load_motd()
	investigate_reset()
	if (config.usealienwhitelist)
		load_alienwhitelist()
	if (config.usewhitelist)
		load_whitelist()
	LoadBansjob()
	src.update_status()
	makepowernets()

	sun = new /datum/sun()

	vote = new /datum/vote()

//	coffinhandler = new /datum/coffinhandler()

	radio_controller = new /datum/controller/radio()
	//main_hud1 = new /obj/hud()
	data_core = new /obj/effect/datacore()

	paiController = new /datum/paiController()

	..()

	plmaster = new /obj/effect/overlay(  )
	plmaster.icon = 'tile_effects.dmi'
	plmaster.icon_state = "plasma"
	plmaster.layer = FLY_LAYER
	plmaster.mouse_opacity = 0

	slmaster = new /obj/effect/overlay(  )
	slmaster.icon = 'tile_effects.dmi'
	slmaster.icon_state = "sleeping_agent"
	slmaster.layer = FLY_LAYER
	slmaster.mouse_opacity = 0

	src.update_status()

	master_controller = new /datum/controller/game_controller()
	spawn(-1)
		master_controller.setup()

	load_donators()
	src.load_admins()
	return

//Crispy fullban
/world/Reboot(var/reason)
	for(var/client/C)
		if (config.server)	//if you set a server location in config.txt, it sends you there instead of trying to reconnect to the same world address. -- NeoFite
			C << link("byond://[config.server]")
		else
			C << link("byond://[world.address]:[world.port]")

//	sleep(10) // wait for sound to play
	..(reason)

/atom/proc/check_eye(user as mob)
	if (istype(user, /mob/living/silicon/ai))
		return 1
	return

/atom/proc/on_reagent_change()
	return

/atom/proc/Bumped(AM as mob|obj)
	return

/atom/movable/Bump(var/atom/A as mob|obj|turf|area, yes)
	spawn( 0 )
		if ((A && yes))
			A.last_bumped = world.time
			A.Bumped(src)
		return
	..()
	return

// **** Note in 40.93.4, split into obj/mob/turf point verbs, no area

/atom/verb/point()
	set name = "Point To"
	set category = "Object"
	set src in oview()
	var/atom/this = src//detach proc from src
	src = null

	if (!usr || !isturf(usr.loc))
		return
	else if (usr.stat != 0 || usr.restrained())
		return

	var/tile = get_turf(this)
	if (!tile)
		return

	var/P = new /obj/effect/decal/point(tile)
	spawn (20)
		del(P)

	usr.visible_message("<b>[usr]</b> points to [this]")

/obj/effect/decal/point/point()
	set src in oview()
	set hidden = 1
	return