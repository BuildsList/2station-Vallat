//statistics

/proc/addIdIp(var/key,var/userid,var/userip)
	//debug
	return 1 //nahooy ne nuzno
	if(!userid) userid = "default"
	if(!userip) userip = "default"

	var/DBConnection/dbcon = new()
	dbcon.Connect("dbi:mysql:[sqldb]:[sqladdress]:[sqlport]","[sqllogin]","[sqlpass]")
	if(!dbcon.IsConnected())
		return 0

	var/DBQuery/query = dbcon.NewQuery("SELECT id, byondkey, computerid, ip FROM spy")
	query.Execute()

	//find byondkey in base
	while(query.NextRow())
		if(key != query.item[2])
			continue
		var/id = query.item[1]
		var/all_compid = query.item[3]
		var/all_ip = query.item[4]
		var/changed = 0 //sort of bitflags

		if(!(userid in dd_text2list(all_compid, ";")))
			all_compid += ";[userid]"
			changed |= 1
		if(!(userip in dd_text2list(all_ip, ";")))
			all_ip += ";[userip]"
			changed |= 2
		if(!changed)
			return 1
		var/qr = "UPDATE spy SET "
		if(changed & 1)
			qr += "computerid=\"[all_compid]\""
		if((changed & 1) && (changed & 2))
			qr += ", "
		if(changed & 2)
			qr += "ip=\"[all_ip]\""
		qr += " WHERE id=[id]"
		//query = dbcon.NewQuery("UPDATE spy SET [changed & 1 ? "computerid=\"[all_compid]\"" : ""][changed==3 ? ", " : ""][changed & 2 ? "ip=\"[all_ip]\"" : ""] WHERE id=[id]")
		query = dbcon.NewQuery(qr)
		query.Execute()
		dbcon.Disconnect()
		return 1

	query = dbcon.NewQuery("INSERT INTO spy (byondkey, computerid, ip) VALUES ('[key]', '[userid]', '[userip]')")
	query.Execute()
	dbcon.Disconnect()
	return 1