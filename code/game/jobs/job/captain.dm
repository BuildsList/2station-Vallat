/datum/job/ssupervisor
	title = "Shift Supervisor"
	flag = SUPERVISOR
	department_flag = MMC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Space Law and the Millenium Mining Company officials"
	selection_colour = "#758b60"
	idtype = /obj/item/weapon/card/id/gold


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		if(H.backbag == 2) H.equip_if_possible(new /obj/item/weapon/storage/backpack/haversack(H), H.slot_back)
		if(H.backbag == 3) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel(H), H.slot_back)
		if(H.backbag == 4) H.equip_if_possible(new /obj/item/weapon/storage/backpack/satchel_norm(H), H.slot_back)
		H.equip_if_possible(new /obj/item/clothing/under/rank/captain(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/jackboots(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/head/helmet/hardhat/white(H), H.slot_head)
		H.equip_if_possible(new /obj/item/clothing/glasses/sunglasses(H), H.slot_glasses)
		H.equip_if_possible(new /obj/item/weapon/gun/projectile/handy(H), H.slot_belt)
		world << "<b>[H.real_name] is the shift supervisor!</b>"
		return 1



/datum/job/hop
	title = "Transhumanist Overseer"
	flag = OVERSEER
	department_flag = TH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Space Law and United Nations Organization"
	selection_colour = "#95a1f7"
	idtype = /obj/item/weapon/card/id/gold


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/device/radio/headset/heads/captain(H), H.slot_ears)
		H.equip_if_possible(new /obj/item/clothing/shoes/brown(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/clothing/under/rank/research_director(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/device/pda/captain(H), H.slot_belt)
		H.equip_if_possible(new /obj/item/clothing/suit/storage/labcoat(H), H.slot_wear_suit)
		H.equip_if_possible(new /obj/item/weapon/clipboard(H), H.slot_l_store)
		world << "<b>[H.real_name] is the transhumanist overseer!</b>"
		return 1