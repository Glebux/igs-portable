# igs-portable
Пополнение доната через IGS
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
