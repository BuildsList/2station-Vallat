/mob/living/carbon/alien/humanoid
	name = "necroid"
	icon_state = "alien_s"

	var/obj/item/clothing/suit/wear_suit = null
	var/obj/item/clothing/head/head = null
	var/obj/item/weapon/r_store = null
	var/obj/item/weapon/l_store = null

	var/icon/stand_icon = null
	var/icon/lying_icon = null
	var/icon/resting_icon = null
	var/icon/running_icon = null

	var/last_b_state = 1.0

	var/image/face_standing = null
	var/image/face_lying = null

	var/image/damageicon_standing = null
	var/image/damageicon_lying = null

/mob/living/carbon/alien/humanoid/hunter
	name = "necroid venator"

	health = 250
	storedPlasma = 100
	max_plasma = 150
	icon_state = "alienh_s"

/mob/living/carbon/alien/humanoid/sentinel
	name = "necroid praeses"

	health = 220
	storedPlasma = 100
	max_plasma = 250
	icon_state = "aliens_s"

/mob/living/carbon/alien/humanoid/drone
	name = "necroid fucus"

	health = 200
	icon_state = "aliend_s"

/mob/living/carbon/alien/humanoid/queen
	name = "necroid loculus"

	health = 350
	icon_state = "queen_s"
	nopush = 1
/mob/living/carbon/alien/humanoid/rpbody
	update_icon = 0

	voice_message = "says"
	say_message = "says"