function nrgbailsystem()
	net.Start("nrgbaildeduct")
	net.SendToServer()
end

net.Receive("nrgplyarrested", function()
	LocalPlayer():ChatPrint("Looks like you were arrested. You can pay £75,000 to get out early! Type /bail")
	hook.Add( "OnPlayerChat", "HelloCommand", function( ply, strText) 
	   	if (ply != LocalPlayer()) then return end
	   	if ply:getDarkRPVar("Arrested") then
			strText = string.lower(strText)
			if ( strText == "/bail" ) then
				nrgbailsystem()
				return true
			end
		end
	end)
end)