local restrictedRoutings = {
	['1'] = 'Admin',
	['2'] = 'Admin',
}

RegisterCommand("mundo", function(source,args)
	local routing = args[1]
	local user_id = vRP.getUserId(source)

	if not routing then
		SetPlayerRoutingBucket(source,0)
		return
	end

	if restrictedRoutings[tostring(routing)] then
		if not vRP.hasGroup(user_id, restrictedRoutings[tostring(routing)]) then
			TriggerClientEvent("Notify",source,"vermelho","Você não tem permissão.",2000)
			return
		end
	end

	SetPlayerRoutingBucket(source,routing)
	TriggerClientEvent("Notify",source,"verde","Você foi para o mundo <b>"..args[1].."</b> !",2000)	
end)