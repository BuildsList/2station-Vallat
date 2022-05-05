/datum/disease/insanity
	name = "Insanity"
	max_stages = 5
	spread = "On contact"
	spread_type = CONTACT_GENERAL
	cure = "Lithium"
	cure_id = "lithium"
	cure_chance = 4
	agent = "Rabies A82.11"
	affected_species = list("Human")
	curable = 0
	permeability_mod = 1
	stage_prob = 30

/datum/disease/gbs/stage_act()
	..()
	switch(stage)
		if(2)
			if(prob(45))
				affected_mob.adjustToxLoss(5)
				affected_mob.updatehealth()
			if(prob(25))
				affected_mob.emote("sneeze")
		if(3)
			if(prob(25))
				affected_mob.emote("cough")
			else if(prob(20))
				affected_mob.emote("gasp")
			if(prob(40))
				affected_mob << "\red You're starting to feel very weak and hunger..."
				affected_mob.nutrition -= 20
		if(4)
			if(prob(40))
				affected_mob.emote("cough")
			if(prob(40))
				if (affected_mob.nutrition > 100)
					affected_mob.Stun(rand(4,6))
					for(var/mob/O in viewers(world.view, affected_mob))
						O.show_message(text("<b>\red [] throws up!</b>", affected_mob), 1)
					playsound(affected_mob.loc, 'splat.ogg', 50, 1)
					var/turf/location = affected_mob.loc
					if (istype(location, /turf/simulated))
						location.add_vomit_floor(affected_mob)
					affected_mob.nutrition -= 95
			if(prob(20))
				affected_mob.adjustOxyLoss(0.5)
				affected_mob.adjustToxLoss(1)
				affected_mob.Weaken(2)
				affected_mob.updatehealth()
		if(5)
			if(prob(50))
				affected_mob <<"\red You dont feel self..."
				affected_mob.adjustToxLoss(5)
				affected_mob.updatehealth()
			if(prob(50))
				new /obj/effect/critter/insane
				del(src)
