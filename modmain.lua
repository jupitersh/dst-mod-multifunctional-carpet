if not GLOBAL.TheNet:GetIsServer() then
	return
end

-- Gives insulation for Winter, insulation for Summer
-- Winter insulation delays freezing, Summer insulation delays overheating
-- The closer to 0, the quicker the freezing/overheating comes
if GetModConfigData("insulation_switch") == 1 then
	AddComponentPostInit("temperature", function(self)
		local _GetInsulation = self.GetInsulation
		self.GetInsulation = function(self)
			local winterInsulation, summerInsulation = _GetInsulation(self)
			local tile, data = self.inst:GetCurrentTileType()
			if tile == GLOBAL.GROUND.CARPET or tile == GLOBAL.GROUND.WOODFLOOR or tile == GLOBAL.GROUND.CHECKER then
				winterInsulation = winterInsulation + GetModConfigData("insulation_time")
				summerInsulation = summerInsulation + GetModConfigData("insulation_time")
			end
			return math.max(0, winterInsulation), math.max(0, summerInsulation)
		end
	end)
end

-- Standing on a carpet during the night only is like wearing a top hat
if GetModConfigData("sanity_switch") == 1 then
	AddPlayerPostInit(function(inst)
		if inst.components.sanity then
			local _crfn = inst.components.sanity.custom_rate_fn
			inst.components.sanity.custom_rate_fn = function(inst)
				local ret = 0
				if _crfn then
					ret = _crfn(inst)
				end
				--if GLOBAL.TheWorld.state.isnight then
					local tile, data = inst:GetCurrentTileType()
					if tile == GLOBAL.GROUND.CARPET or tile == GLOBAL.GROUND.WOODFLOOR or tile == GLOBAL.GROUND.CHECKER then
						local carpet_delta = GLOBAL.TUNING.DAPPERNESS_MED
						ret = ret + carpet_delta
					end
				--end
				return ret
			end
		end
	end)
end

-- Things with moisture stay dry when standing on carpet
if GetModConfigData("rainproof_switch") == 1 then
	AddComponentPostInit("moisture", function(self)
		local _GetMoistureRate = self.GetMoistureRate
		self.GetMoistureRate = function(self)
			local tile, data = self.inst:GetCurrentTileType()
			if tile == GLOBAL.GROUND.CARPET or tile == GLOBAL.GROUND.WOODFLOOR or tile == GLOBAL.GROUND.CHECKER then
				return 0
			end
			return _GetMoistureRate(self)
		end
	end)
end

if GetModConfigData("speed_switch") == 1 then
	AddComponentPostInit("locomotor", function(self)
		if self.inst:HasTag("player") then
			local _UGSM = self.UpdateGroundSpeedMultiplier
			self.UpdateGroundSpeedMultiplier = function(self)
				_UGSM(self)
				local tile, data = self.inst:GetCurrentTileType()
				if tile == GLOBAL.GROUND.CARPET or tile == GLOBAL.GROUND.WOODFLOOR or tile == GLOBAL.GROUND.CHECKER then
					if self.carpetfast == nil then
						self:SetExternalSpeedMultiplier(self.inst, "CarpetSpeed", GetModConfigData("speed_mult"))
						self.carpetfast = true
					end
				else
					if self.carpetfast == true then
						self:RemoveExternalSpeedMultiplier(self.inst, "CarpetSpeed")
						self.carpetfast = nil
					end
				end
			end
		end
	end)
end