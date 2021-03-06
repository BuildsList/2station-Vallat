//ported from old bs12 by Cael
//some modifications so that it's more stable, and it's primary purpose is producing plasma instead of power
//frequency is 1-1e9

//#define NITROGEN_RETARDATION_FACTOR 10	//Higher == N2 slows reaction more
//#define THERMAL_RELEASE_MODIFIER 5		//Higher == less heat released during reaction
//#define PLASMA_RELEASE_MODIFIER 200		//Higher == more plasma released by reaction
//#define OXYGEN_RELEASE_MODIFIER 1500	//Higher == more oxygen released at high temperature/power
//#define REACTION_POWER_MODIFIER 0.02	//Higher == more overall power
//#define OVERLOAD_TEMP 1500 + T0C //New constant for tuning
//#define MINIMAL_TEMP_FACTOR 0.1			//Higher == more energy is produced at 0 K

/obj/machinery/power/supermatter
	name = "Supermatter"
	desc = "A strangely translucent and iridescent crystal.  \red You get headaches just from looking at it."
	icon = 'engine.dmi'
	icon_state = "darkmatter"
	density = 1
	anchored = 1

	var/NITROGEN_RETARDATION_FACTOR=10	//Higher == N2 slows reaction more
	var/THERMAL_RELEASE_MODIFIER=1		//Higher == less heat released during reaction
	var/PLASMA_RELEASE_MODIFIER=200		//Higher == more plasma released by reaction
	var/OXYGEN_RELEASE_MODIFIER=1500	//Higher == more oxygen released at high temperature/power
	var/REACTION_POWER_MODIFIER=300		//Higher == more overall power
	var/OVERLOAD_TEMP=1500 + T0C 		//New constant for tuning
	var/MINIMAL_TEMP_FACTOR=0.1			//Higher == more energy is produced at 0 K

	var/mega_energy = 0

	var/gasefficency = 0.25

	var/det = 0
	var/previousdet = 0
	var/const/explosiondet = 3500
	var/frequency = 50000

	var/const/warningtime = 50 	// Make the CORE OVERLOAD message repeat only every aprox. ?? seconds
	var/lastwarning = 0			// Time in 1/10th of seconds since the last sent warning

	New()
		..()
		spawn(1)
			ul_SetLuminosity(4,6,0)

	bullet_act(var/obj/item/projectile/Proj)
		if(Proj.flag != "bullet")
			var/obj/item/projectile/beam/laserbeam = Proj
			var/energy_loss_ratio = abs(laserbeam.frequency - frequency) / 1000000
			var/energy_delta = laserbeam.damage / 600
			mega_energy += energy_delta - energy_delta * energy_loss_ratio
		return 0

	proc/explosion_supa()
		var/obj/effect/landmark/L = new /obj/effect/landmark(src.loc)
		explosion(L.loc,2,4,8,32,1)
		sleep(50)
		radioalert("CORE EXPLOSION SHOCKWAVE DETECTED","Core control computer")
		sleep(200)
		explosion(L.loc,4,8,16,32,1)
		sleep(50)
		radioalert("CORE EXPLOSION SHOCKWAVE DETECTED","Core control computer")
		sleep(400)
		explosion(L.loc,6,12,24,48,1)
		sleep(50)
		radioalert("CORE EXPLOSION SHOCKWAVE DETECTED","Core control computer")
		sleep(600)
		explosion(L.loc,8,16,48,100,1)
		del(L)
		for(var/obj/effect/landmark/LM in world)
			if(LM.name == "Supa-Explosion")
				if(prob(20))
					sleep(200)
					explosion(LM.loc,1,2,3,16,1)

/*
/obj/machinery/engine/klaxon
	name = "Emergency Klaxon"
	icon = 'engine.dmi'
	icon_state = "darkmatter"
	density = 1
	anchored = 1
	var/obj/machinery/engine/supermatter/sup

/obj/machinery/engine/klaxon/process()
	if(!sup)
		for(var/obj/machinery/engine/supermatter/T in world)
			sup = T
			break
	if(sup.det >= 1)
		return
		*/

//a lot of these variables are pretty hacked, so dont rely on the comments
/obj/machinery/power/supermatter/process()
	//core can no longer spontaneously explode
	var/datum/gas_mixture/env = loc.return_air()
	//nothing can happen in a vacuum
	var/datum/gas_mixture/removed = env
	var/retardation_factor = 0.5
	previousdet = det
	det += (removed.temperature - OVERLOAD_TEMP) / 150
	det = max(det, 0)

	if(det > 300 && removed.temperature > OVERLOAD_TEMP) // while the core is still damaged and it's still worth noting its status
		if((world.realtime - lastwarning) / 10 >= warningtime)
			lastwarning = world.realtime
			if(explosiondet - det <= 300)
				radioalert("CORE EXPLOSION IMMINENT","Core control computer")
			else if(det >= previousdet && det >= 300)   // The damage is still going up
				radioalert("CORE OVERLOAD","Core control computer")

	if (previousdet > 300 && det <= 300 )						  // Phew, we're safe
		lastwarning = world.realtime
		radioalert("Core returning to safe operating levels.","Core control computer")

	if(det > explosiondet)
		//proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, force = 0)
		det = 0
		explosion_supa()


	if (!removed)
		return 1

	//var/power = max(round((removed.temperature - T0C) / 20), 0) //Total laser power plus an overload factor

	//Get the collective laser power
	/*
	for(var/dir in cardinal)
		var/turf/T = get_step(L, dir)
		for(var/obj/beam/e_beam/item in T)
			power += item.power
	*/

/*
#define NITROGEN_RETARDATION_FACTOR 4	//Higher == N2 slows reaction more
#define THERMAL_RELEASE_MODIFIER 50		//Higher == less heat released during reaction
#define PLASMA_RELEASE_MODIFIER 750		//Higher == less plasma released by reaction
#define OXYGEN_RELEASE_MODIFIER 1500	//Higher == less oxygen released at high temperature/power
#define REACTION_POWER_MODIFIER 0.5		//Higher == more overall power
*/

	if(env.total_moles)
		//Remove gas from surrounding area
		var/transfer_moles = gasefficency * env.total_moles
		removed = env.remove(transfer_moles)

		//100% oxygen atmosphere = 100% plasma production
		//100% nitrogen atmosphere = 0% plasma production
		//anything else is halfway in between; an atmosphere with no nitrogen or oxygen will still be at 50% (but steadily rise as more oxygen is made)
		var/total_moles = removed.total_moles
		if(total_moles)
			retardation_factor += removed.oxygen / (total_moles * 2) - removed.nitrogen / (total_moles * 2)
		else
			retardation_factor -= 0.25

	var/device_energy = mega_energy * REACTION_POWER_MODIFIER			//device energy is provided by the zero point lasers
	device_energy *= sqrt(removed.temperature / T0C)*(1-MINIMAL_TEMP_FACTOR)+MINIMAL_TEMP_FACTOR//environmental heat directly affects device energy
	device_energy = max(device_energy,0)

	//To figure out how much temperature to add each tick, consider that at one atmosphere's worth
	//of pure oxygen, with all four lasers firing at standard energy and no N2 present, at room temperature
	//that the device energy is around 2140.  At that stage, we don't want too much heat to be put out
	//Since the core is effectively "cold"

	//Also keep in mind we are only adding this temperature to (efficiency)% of the one tile the rock
	//is on.  An increase of 4*C @ 25% efficiency here results in an increase of 1*C / (#tilesincore) overall.
	removed.temperature += max((device_energy / THERMAL_RELEASE_MODIFIER), 0)

	//Calculate how much gas to release
	var/produced = device_energy * PLASMA_RELEASE_MODIFIER * retardation_factor
	removed.toxins += produced
	//
	produced = device_energy * OXYGEN_RELEASE_MODIFIER * (1 - retardation_factor)
	removed.oxygen += produced
	removed.update_values()
	//
	mega_energy = 0

		//instead of producing oxygen, consume it to produce plasma,
		//use an amount proportional to the plasma produced
		//removed.oxygen -= produced
		//removed.oxygen += max(round((device_energy + removed.temperature - T0C) / OXYGEN_RELEASE_MODIFIER), 0)

	env.merge(removed)

	//talk to sky re hallucinations, because i'm lazy like that
	for(var/mob/living/l in view(src, 6)) // you have to be seeing the core to get hallucinations
		if(istype(l, /mob/living/carbon/human))
			if(prob(10) && !(l:glasses && istype(l:glasses, /obj/item/clothing/glasses/meson)))
				l.hallucination = 50
		else
			l.hallucination = 50

	for(var/mob/living/l in view(src,3))
		l.bruteloss += 50
		l.updatehealth()
	return 1

