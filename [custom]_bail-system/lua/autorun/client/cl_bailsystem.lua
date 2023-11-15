local displaybailprice = 75000 -- This will not change the ammount it costs this is only for display
-- To change the cost of bail please edit the sv_bailsystem.lua variable on line 4

function nrgbailsystem()
	net.Start("nrgbaildeduct")
	net.SendToServer()
end

net.Receive("nrgplyarrested", function()
	LocalPlayer():ChatPrint("Looks like you were arrested. You can pay "..DarkRP.formatMoney(displaybailprice).." to get out early! Type /bail")
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