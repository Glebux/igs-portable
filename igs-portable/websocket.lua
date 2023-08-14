local function handleUpdate(upd)

	if not upd.ok then
		return
	end

	-- {cp = true/false, data = {}, ok = true, method = "payment"}
	hook.Run("IGS.IncomingMessage", upd.data, upd.method, upd)
end
if IGS.POLLING then
	IGS.POLLING.stop()
end
local uid = string.format("gmd_%s_%s", IGS.UID, IGS.SECRET) -- antinil
timer.Simple(0, function()
	IGS.POLLING = kupol.new("https://poll.gmod.app/", uid, 30).start(handleUpdate)
end)