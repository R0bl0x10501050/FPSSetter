local FPSSetter = {}

function FPSSetter:SetFPS(player, fps)
	local AllPlayers = nil
	
	if player == nil then
		AllPlayers = true
	else
		AllPlayers = false
	end
	
	if fps == nil then
		fps = 30
	end
	
	if AllPlayers == false then
		if (tostring(player) ~= nil) and (game.Players:FindFirstChild(player)) then
			local plr = game.Players:FindFirstChild(player)
			
			local oldscript = plr.PlayerGui:FindFirstChild("FPSSetting")
			if oldscript then oldscript:Destroy() end
			
			pcall(function()
				local src = script.FPSSetting:Clone()
				src.Parent = plr.PlayerGui
				src.Name = "FPSSetting"
				src:SetAttribute("MaxFPS", fps)
			end)
		elseif (tonumber(player) ~= nil) and (not game.Players:FindFirstChild(player)) then
			local plr = game.Players:GetPlayerByUserId(player)
			
			local oldscript = plr.PlayerGui:FindFirstChild("FPSSetting")
			if oldscript then oldscript:Destroy() end
			
			pcall(function()
				local src = script.FPSSetting:Clone()
				src.Parent = plr.PlayerGui
				src.Name = "FPSSetting"
				src:SetAttribute("MaxFPS", fps)
			end)
		elseif player.Parent == game.Players then
			local oldscript = player.PlayerGui:FindFirstChild("FPSSetting")
			if oldscript then oldscript:Destroy() end
			
			pcall(function()
				local src = script.FPSSetting:Clone()
				src.Parent = player.PlayerGui
				src.Name = "FPSSetting"
				src:SetAttribute("MaxFPS", fps)
			end)
		else
			error("'Player' is not a Player instance, name, or UserId!")
		end
	elseif AllPlayers == true then
		for i, player in pairs(game.Players:GetPlayers()) do
			local oldscript = player.PlayerGui:FindFirstChild("FPSSetting")
			if oldscript then oldscript:Destroy() end
			
			pcall(function()
				local src = script.FPSSetting:Clone()
				src.Parent = player.PlayerGui
				src.Name = "FPSSetting"
				src:SetAttribute("MaxFPS", fps)
			end)
		end
	end
end


return FPSSetter
