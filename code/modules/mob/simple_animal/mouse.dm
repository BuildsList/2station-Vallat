/mob/living/simple_animal/mouse
	name = "mouse"
	desc = "It's a small, disease-ridden rodent."
	icon = 'mob.dmi'
	icon_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	speak = list("Squeek!","SQUEEK!","Squeek?")
	speak_emote = list("squeeks","squeeks","squiks")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	health = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm   = "splats the"
	density = 0
	var/colour	//brown, gray and white
	layer = 2.5		//so they can hide under objects

/mob/living/simple_animal/mouse/Life()
	..()
	if(!stat && prob(speak_chance))
		for(var/mob/M in view())
			M << 'sound/effects/mousesqueek.ogg'

/mob/living/simple_animal/mouse/gray
	colour = "gray"
	icon_state = "mouse_gray"

/mob/living/simple_animal/mouse/white
	colour = "white"
	icon_state = "mouse_white"

/mob/living/simple_animal/mouse/brown
	colour = "brown"
	icon_state = "mouse_brown"

/mob/living/simple_animal/mouse/New()
	if(!colour)
		colour = pick( list("brown","gray","white") )
	icon_state = "mouse_[colour]"
	icon_living = "mouse_[colour]"
	icon_dead = "mouse_[colour]_dead"
	desc = "It's a small [colour] rodent, often seen hiding in maintenance areas."

/mob/living/simple_animal/mouse/proc/splat()
	src.health = 0
	src.stat = DEAD
	src.icon_dead = "mouse_[colour]_splat"
	src.icon_state = "mouse_[colour]_splat"

/proc/ismouse(var/obj/O)
	return istype(O,/mob/living/simple_animal/mouse)
