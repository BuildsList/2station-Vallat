/obj/item/weapon/gun/projectile/shotgun/pump/trencher
	name = "Trencher MK2"
	desc = "A infantry shotgun for close range massacre"
	icon_state = "trencher"
	w_class = 3.0
	max_shells = 8
	origin_tech = "combat=5;materials=2"
	ammo_type = "/obj/item/ammo_casing/lead"


/obj/item/weapon/gun/projectile/shotgun/cerber
	name = "Cerber"
	desc = "A angry and hungry triple-barreled beast"
	icon_state = "cerber"
	max_shells = 3
	w_class = 4.0
	force = 10
	flags =  FPRINT | TABLEPASS | CONDUCT | USEDELAY
	slot_flags = SLOT_BACK
	caliber = "shotgun"
	origin_tech = "combat=3;materials=2"
	ammo_type = "/obj/item/ammo_casing/shotgun/lead"

	New()
		for(var/i = 1, i <= max_shells, i++)
			loaded += new ammo_type(src)

		update_icon()
		return

	load_into_chamber()
//		if(in_chamber)
//			return 1 {R}
		if(!loaded.len)
			return 0

		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		AC.desc += " This one is spent."

		if(AC.BB)
			in_chamber = AC.BB //Load projectile into chamber.
			AC.BB.loc = src //Set projectile loc to gun.
			return 1
		return 0

	attack_self(mob/living/user as mob)
		if(..())
			if(!(locate(/obj/item/ammo_casing/shotgun) in src) && !loaded.len)
				user << "<span class='notice'>\The [src] is empty.</span>"
				return

			for(var/obj/item/ammo_casing/shotgun/shell in src)	//This feels like a hack.	//don't code at 3:30am kids!!
				if(shell in loaded)
					loaded -= shell
				shell.loc = get_turf(src.loc)

			user << "<span class='notice'>You break \the [src].</span>"
			update_icon()
		return

	attackby(var/obj/item/A as obj, mob/user as mob)
		if(istype(A, /obj/item/ammo_casing) && !load_method)
			var/obj/item/ammo_casing/AC = A
			if(AC.caliber == caliber && (loaded.len < max_shells) && (contents.len < max_shells))	//forgive me father, for i have sinned
				user.drop_item()
				AC.loc = src
				loaded += AC
				user << "<span class='notice'>You load a shell into \the [src]!</span>"
		A.update_icon()
		update_icon()
