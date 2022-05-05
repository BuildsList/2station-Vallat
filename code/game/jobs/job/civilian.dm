//Science
/datum/job/hon
	title = "Head of Nutrition"
	flag = HON
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_colour = "#ffddf0"
	idtype = /obj/item/weapon/card/id/silver


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/device/radio/headset/heads/cmo(H), H.slot_ears)
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_med(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/sl_suit(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/brown(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/device/pda(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/labcoat(H), H.slot_wear_suit)
		return 1


/datum/job/chef
	title = "Chef"
	flag = CHEF
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of nutrition"
	selection_colour = "#dddddd"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/clothing/under/rank/chef(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/chef(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/head/chefhat(H), H.slot_head)
		H.equip_if_possible(new /obj/item/device/pda/chef(H), H.slot_belt)
		return 1


/datum/job/hydro
	title = "Botanist"
	flag = BOTANIST
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of nutrition"
	selection_colour = "#dddddd"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_norm(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/rank/hydroponics(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/gloves/botanic_leather(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/apron(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/device/analyzer/plant_analyzer(H), H.slot_s_store)
		H.equip_if_possible(new /obj/item/device/pda/botanist(H), H.slot_belt)
		return 1


/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_colour = "#dddddd"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/clothing/under/rank/janitor(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/device/pda/janitor(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/device/portalathe(H), H.slot_in_backpack)
		return 1


//Mining
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_flag = MMC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the shift supervisor"
	selection_colour = "#838b60"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_norm(H), H.slot_back)
		H.equip_if_possible(new /obj/item/weapon/gun/projectile/doubly(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/under/rank/unit(H), H.slot_w_uniform)
		return 1


/datum/job/cargo_tech
	title = "Cargo Unit"
	flag = CARGOTECH
	department_flag = MMC
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the shift supervisor"
	selection_colour = "#8b7d60"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/haversack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_eng(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/rank/unit_d(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/jackboots(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/gloves/fingerless/black(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/weapon/gun/projectile/nipper(H), H.slot_belt)
		return 1



/datum/job/mining
	title = "Unit"
	flag = UNIT
	department_flag = MMC
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	supervisors = "the shift supervisor"
	selection_colour = "#838b60"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/industrial (H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_eng(H), H.slot_back)
		H.equip_if_possible(new /obj/item/device/pda/shaftminer(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/under/rank/unit(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/gloves/fingerless/black(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/weapon/gun/projectile/doubly(H), H.slot_belt)
		if(H.backbag == 1)
			H.equip_if_possible(new /obj/item/weapon/storage/box(H), H.slot_r_hand)
			H.equip_if_possible(new /obj/item/weapon/crowbar(H), H.slot_l_hand)
			H.equip_if_possible(new /obj/item/weapon/satchel(H), H.slot_l_store)
		else
			H.equip_if_possible(new /obj/item/weapon/storage/box(H.back), H.slot_in_backpack)
			H.equip_if_possible(new /obj/item/weapon/crowbar(H), H.slot_in_backpack)
			H.equip_if_possible(new /obj/item/weapon/satchel(H), H.slot_in_backpack)
		return 1



