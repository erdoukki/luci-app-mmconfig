-- Copyright 2008 Yanira <forum-2008@email.de>
-- Licensed to the public under the Apache License 2.0.

require("nixio.fs")

local m
local s

m = Map("modemconfig", translate("Configure modem bands"),
	translate("Configuration 2G/3G/4G modem frequency bands."))

s = m:section(TypedSection, "modem", "<p>&nbsp;</p>" .. translate("Choose bands cellular modem"))
s.anonymous = true

gsm = s:option(DynamicList, "gsm_band", translate("2G"))
gsm:value("8", "GSM900")
gsm:value("3", "GSM1800")
gsm.rmempty = true

wcdma = s:option(DynamicList, "3g_band", translate("3G"))
wcdma:value("9", "WCDMA850")
wcdma:value("8", "WCDMA900")
wcdma:value("1", "WCDMA2100")
s.rmempty = true

lte = s:option(DynamicList, "lte_band", translate("4G"),
translate("Maybe must reconnect cellular interface."))
lte:value("1", "LTE B1 FDD")
lte:value("3", "LTE B3 FDD")
lte:value("7", "LTE B7 FDD")
lte:value("8", "LTE B8 FDD")
lte:value("20", "LTE B20 FDD")
lte:value("38", "LTE B38 TDD")
lte:value("40", "LTE B40 TDD")
lte:value("41", "LTE B41 TDD")
s.rmempty = true

function m.on_after_commit(Map)
        luci.sys.call("/usr/bin/modemconfig")
end

return m
