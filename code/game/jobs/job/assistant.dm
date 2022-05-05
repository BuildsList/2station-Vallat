/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department_flag = TH
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_colour = "#dddddd"

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/clothing/under/colour/grey(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/black(H), H.slot_shoes)
		return 1
