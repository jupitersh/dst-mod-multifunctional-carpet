name = "Multifunctional Carpet"
description = [[
	Carpeted turf, checked turf and wooden turf will have more function other than decoration.
]]
author = "[BSy]Jupiter"
version = "1.0.2"
forumthread = ""

api_version = 10

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = false
client_only_mod = false
dst_compatible = true
server_filter_tags = {"Multifunctional Carpet"}

configuration_options =
{
	{
		name = "insulation_switch",
		label = "Insulation Switch",
		hover = "Configure whether you want to enable insulation or not.",
		options =	{
						{description = "On", data = 1, hover = ""},
						{description = "Off", data = 0, hover = ""},
					},
		default = 1,
	},
	{
		name = "insulation_time",
		label = "Insulation Time",
		hover = "Configure the time of insulation. Only execute when Insulation Switch is on.",
		options =	{
						{description = "Short", data = 120, hover = ""},
						{description = "Medium", data = 240, hover = ""},
						{description = "Long", data = 480, hover = ""},
						{description = "Very Long", data = 960, hover = ""},
						{description = "Always", data = 99999999999999, hover = ""},
					},
		default = 240,
	},
	{
		name = "sanity_switch",
		label = "Sanity Switch",
		hover = "Configure whether you want to enable sanity regain or not.",
		options =	{
						{description = "On", data = 1, hover = ""},
						{description = "Off", data = 0, hover = ""},
					},
		default = 1,
	},
	{
		name = "rainproof_switch",
		label = "Rain Proof Switch",
		hover = "Configure whether you want to enable rain proof or not.",
		options =	{
						{description = "On", data = 1, hover = ""},
						{description = "Off", data = 0, hover = ""},
					},
		default = 1,
	},
	{
		name = "speed_switch",
		label = "Speed Boost Switch",
		hover = "Configure whether you want to enable speed boost or not.",
		options =	{
						{description = "On", data = 1, hover = ""},
						{description = "Off", data = 0, hover = ""},
					},
		default = 1,
	},
	{
		name = "speed_mult",
		label = "Speed Customize",
		hover = "Configure the walking speed standing on these carpet. Only execute when Speed Boost Switch is on.",
		options =	{
						{description = "1.25", data = 1.25, hover = "1.25 times"},
						{description = "1.5", data = 1.5, hover = "1.5 times"},
						{description = "1.75", data = 1.75, hover = "1.75 times"},
						{description = "2", data = 2, hover = "2 times"},
					},
		default = 1.25,
	},
}