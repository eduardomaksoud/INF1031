-- tabuleiro.lua

local t = {}
t.px = 16
t.py = 16
function t.tam_quad(i)
  local w,h = W,H
  local tam_pixel = {w/t.px,h/t.py}
  return tam_pixel[i]
end
function t.geraMap()
  mt = {}
  for i=0,t.px do
    mt[i] = {}
    for j=0,t.py do
      mt[i][j] = true
    end
  end
  return mt

end
function t.limite(obj)
  local w,h = W,H
  if obj.corpo[1].x*t.tam_quad(1) < 0 then  
    tempodestun = 5
    estadoDeStun = true
    return false
  end
  if obj.corpo[1].x*t.tam_quad(1) > w then
    tempodestun = 5
    estadoDeStun = true
    return false
  end
  if obj.corpo[1].y*t.tam_quad(2) < 0 then
    tempodestun = 5
    estadoDeStun = true
    return false
  end
  if obj.corpo[1].y*t.tam_quad(2) > h then 
    tempodestun = 5
    estadoDeStun = true
    return false
  end
  return true
end
function t.gera_tangerina(Map)
  local x_tangerina = math.random(1,t.px-1)
  local y_tangerina = math.random(1,t.py-1)
  while  Map[x_tangerina][y_tangerina]==false do
    x_tangerina = math.random(0,t.px-1)
    y_tangerina = math.random(0,t.py-1)
  end
  return {x = x_tangerina,y = y_tangerina}
end
return t
