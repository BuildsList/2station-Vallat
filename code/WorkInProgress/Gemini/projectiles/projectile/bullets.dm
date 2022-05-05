/obj/item/projectile/bullet
	name = "\improper Bullet"
	icon_state = "bullet"
	damage = 60
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"


/obj/item/projectile/bullet/weakbullet
	damage = 15
	stun = 5
	weaken = 5


/obj/item/projectile/bullet/midbullet
	damage = 30
	stun = 5
	weaken = 5
	eyeblur = 3

/obj/item/projectile/bullet/suffocationbullet//How does this even work?
//	name = "\improper ullet"
	damage = 20
	damage_type = OXY


/obj/item/projectile/bullet/cyanideround
	name = "\improper Poison Bullet"
	damage = 40
	damage_type = TOX


/obj/item/projectile/bullet/burstbullet//I think this one needs something for the on hit
	name = "\improper Exploding Bullet"
	damage = 20

/obj/item/projectile/bullet/toxicshell
	name = "toxic shell"
	damage = 25
	damage_type = TOX

/obj/item/projectile/bullet/stunshot
	name = "\improper Stunshot"
	damage = 15
	stun = 10
	weaken = 10
	stutter = 10

//gemini

/obj/item/projectile/bullet/smbullet
	damage = 15
	stun = 2
	weaken = 5
	name = "\improper Bullet"
	icon_state = "bullet"
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"


/obj/item/projectile/bullet/mdbullet
	damage = 35
	stun = 5
	weaken = 10
	eyeblur = 3
	name = "\improper Bullet"
	icon_state = "bullet"
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"


/obj/item/projectile/bullet/bgbullet
	damage = 40
	stun = 5
	weaken = 10
	stutter = 5
	eyeblur = 5
	name = "\improper Bullet"
	icon_state = "bullet"
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"



/obj/item/projectile/bullet/lead
	name ="lead"
	icon_state= "lead"
	damage = 10
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"

	on_hit(var/atom/target, var/blocked = 1)
		explosion(-1, -1, 1, -1)
		return 1

/obj/item/projectile/bullet/gaussbullet
	damage = 60
	stun = 5
	weaken = 5
	stutter = 5
	eyeblur = 5
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	name = "\improper Bullet"
	icon_state = "bullet"
	damage_type = BRUTE
	flag = "bullet"

	on_hit(var/blocked = 0)
		if(blocked >= 2)	return 0
		return 1