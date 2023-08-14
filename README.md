# igs-portable
Интеграция пополнения доната через IGS
# Внимание
Пополнение работает только если сервер запущен на момент транзакции, по-этому не давайте глобальную ссылку на пополнение, так как есть риск потери денежных средств
# Настройка
Зайдите в igs-portable/cfg.lua и введите данные с панели GMD
# Использование для пополнения
Чтобы интегрировать пополнение GMD в ваш донат-магазин, скопируйте наш образец и добавте функцию пополнения
```lua
hook.Add("IGS.IncomingMessage", "deposit", function(data, method)
  if data.method == "pay" then
    local sum = data.orderSum -- сумма пополнения
    local steamid64 = data.SteamID64
    local steamid = util.SteamIDFrom64(steamid64)
    -- ваш код
  end
end)
```
# Генерация ссылки на пополнение
Пример:
```lua
--SV
util.AddNetworkString('donate.geturl')
net.Receive('donate.geturl', function(_, ply)
	local sum = net.ReadInt(32)
	IGS.GetPaymentURL(function(url)
		net.Start('donate.geturl')
		net.WriteString(url)
		net.Send(ply)
	end, ply:SteamID64(), sum)
end)
--CL
local function geturl(sum)
  net.Start('donate.geturl')
  net.WriteInt(sum, 32)
  net.SendToServer()
end
net.Receive('donate.geturl', function()
  local url = net.ReadString()
  gui.OpenURL(url)
end)
```
