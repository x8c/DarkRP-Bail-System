util.AddNetworkString("nrgbaildeduct")
util.AddNetworkString("nrgplyarrested")

net.Receive("nrgbaildeduct", function(len, ply)
	if ply:getDarkRPVar("money") >= 75000 then
		ply:addMoney(-75000)
		ply:unArrest(ply)
	else
		ply:ChatPrint("You dont have enough money to bail yourself out! You need at least £75,000")
	end
end)


hook.Add("playerArrested","onarrestNRG" ,function(crim,time,arester)
	net.Start("nrgplyarrested")
	net.Send(crim)
end )