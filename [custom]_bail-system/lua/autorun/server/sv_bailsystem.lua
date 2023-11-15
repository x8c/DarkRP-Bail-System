util.AddNetworkString("nrgbaildeduct")
util.AddNetworkString("nrgplyarrested")

local bailammount = 75000

net.Receive("nrgbaildeduct", function(len, ply)
	if ply:getDarkRPVar("money") >= bailammount then
		ply:addMoney(-bailammount)
		ply:unArrest(ply)
	else
		ply:ChatPrint("You dont have enough money to bail yourself out! You need at least "..DarkRP.formatMoney(bailammount))
	end
end)


hook.Add("playerArrested","onarrestNRG" ,function(crim,time,arester)
	net.Start("nrgplyarrested")
	net.Send(crim)
end )