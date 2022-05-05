/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the transhumanist overseer"
	selection_colour = "#ffdddd"
	idtype = /obj/item/weapon/card/id/silver


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/security (H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_sec(H), H.slot_back)
		H.equip_if_possible(new /obj/item/device/radio/headset/heads/hos(H), H.slot_ears)
		H.equip_if_possible(new /obj/item/clothing/under/rank/hos(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/jackboots(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/mask/gas(H), H.slot_wear_mask)
		H.equip_if_possible(new /obj/item/device/pda/heads/hos(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/gloves/hos(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/clothing/head/hosberet(H), H.slot_head)
		H.equip_if_possible(new /obj/item/clothing/glasses/sunglasses/sechud(H), H.slot_glasses)
		H.equip_if_possible(new /obj/item/weapon/handcuffs(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/weapon/gun/energy/gun(H), H.slot_in_backpack)
		return 1



/datum/job/warden
	title = "Chief Security Officer"
	flag = CSO
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_colour = "#ffeeee"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/device/radio/headset/headset_sec(H), H.slot_ears)
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/security(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_sec(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/rank/cso(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/jackboots(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/device/pda/security(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/suit/armor/bulletproof(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/clothing/head/csoberet(H), H.slot_head)
		H.equip_if_possible(new /obj/item/clothing/gloves/black(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/clothing/glasses/sunglasses/sechud(H), H.slot_glasses)
		H.equip_if_possible(new /obj/item/weapon/handcuffs(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/device/flash(H), H.slot_l_store)
		return 1



/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Space Law and Nanotrasen Corp"
	selection_colour = "#abf6c4"
	alt_titles = list("Forensic Technician")
	idtype = /obj/item/weapon/card/id/silver

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/device/radio/headset/headset_sec(H), H.slot_ears)
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_norm(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/det(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/det_suit(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/clothing/shoes/brown(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/device/pda/detective(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/head/det_hat(H), H.slot_head)
		H.equip_if_possible(new /obj/item/clothing/gloves/detective(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/weapon/storage/box/evidence(H.back), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/weapon/fcardholder(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/device/detective_scanner(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/weapon/reagent_containers/food/drinks/dflask(H.back), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/weapon/lighter/zippo(H), H.slot_l_store)
		return 1



/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_flag = TH
	faction = "Station"
	total_positions = 12
	spawn_positions = 12
	supervisors = "the chief security officer and the head of security"
	selection_colour = "#ffeeee"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/device/radio/headset/headset_sec(H), H.slot_ears)
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/security(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_sec(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/rank/officer(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/jackboots(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/device/pda/security(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/gearharness(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/clothing/head/soberet(H), H.slot_head)
		H.equip_if_possible(new /obj/item/weapon/handcuffs(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/clothing/gloves/black(H), H.slot_gloves)
		H.equip_if_possible(new /obj/item/weapon/handcuffs(H), H.slot_s_store)
		H.equip_if_possible(new /obj/item/device/flash(H), H.slot_l_store)
		return 1
