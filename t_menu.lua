Menu = {}
g = love.graphics
require "load_icons"
function Menu.reset()
  font_mais = g.newFont("Font/adventure.ttf",60)
  texto = M.new(font_mais,"S")
  ds_x,ds_y = sound:getDimensions()
  dse_x,dse_y = settings_g:getDimensions()
  dl_x,dl_y = leaderboard_g:getDimensions()
  dsh_x,dsh_y = shop_g:getDimensions()
  dp_x,dp_y = playbutton_w:getDimensions()
end
function Menu.load()
end
function Menu.draw()
  x_m,y_m = love.mouse.getPosition()
  Muted = true
  -- BACKGROUND DRAW ----
  for i = 0, g.getWidth() / background:getWidth() do
    for j = 0, g.getHeight() / background:getHeight() do
      g.draw(background, i * background:getWidth(), j * background:getHeight())
    end
  end
-- TITLE DRAW ----
  g.setColor(198/255,169/255,0)
  g.rectangle("fill",0,71,69*7,71)
  g.setColor(0,0,0)
  g.rectangle("line",0,71,69*7,71)
  M.setColor(texto,255,255,255)
  M.drawtext(texto,69*3/2,71.4*3/2,"S")
  M.drawtext(texto,69*5/2,71.4*3/2,"N")
  M.drawtext(texto,69*7/2,71.4*3/2,"A")
  M.drawtext(texto,69*9/2,71.4*3/2,"K")
  M.drawtext(texto,69*11/2,71.4*3/2,"E")

  g.setColor(255,255,255)

-- SOUND ICON DRAW ----
  g.draw(sound,420,15,0,1/18,1/18)
-- CONFIG ICON DRAW ----
  if (x_m>5 and x_m<5+dse_x/5) and (y_m>435 and y_m<435+dse_y/5) then
    g.draw(settings_w,5,435,0,1/5,1/5)
    if love.mouse.isDown(1) then
      config.reset()
      Tela = config
    end
  else
    g.draw(settings_g,5,435,0,1/5,1/5)
  end
-- LEADERBOARD ICON DRAW ----
  if (x_m>0 and x_m<dl_x/5) and (y_m>5 and y_m<5+dl_y/5)  then
    g.draw(leaderboard_w,0,5,0,1/5,1/5)
  else
    g.draw(leaderboard_g,0,5,0,1/5,1/5)
  end
-- SHOP ICON DRAW ----
  if (x_m>75 and x_m<75+dsh_x/21) and (y_m>10 and y_m<10+dsh_y/21) then
    g.draw(shop_w,75,10,0,1/21,1/21)
    if love.mouse.isDown(1) then
      mode = loja
      mode.reset()
      Tela = loja
    end
  else
    g.draw(shop_g,75,10,0,1/21,1/21)
  end
-- PLAY BUTTON DRAW --
  if x_m>120 and x_m<120+dp_x/1.4 and y_m>245 and y_m<245+dp_y/1.4 then
    g.draw(playbutton_b,120,245,0,1/1.4,1/1.4)
    if love.mouse.isDown(1) then
      inicio.reset()
      Tela = inicio
    end
  else
    g.draw(playbutton_w,120,245,0,1/1.4,1/1.4)
  end
-- DESIGN DRAW --
  g.setColor(0,0,0)
  g.rectangle("fill",0,71.4*2,205,68) 
  g.rectangle("fill",135,69*3,70,40)
  g.rectangle("fill",135,71.1*5,70,71.4)
  g.rectangle("fill",67.5*2,71*6,68.5*6,71.4)
  g.rectangle("fill",68.5*6,71*5,68.7,71)
  g.rectangle("fill",68.5*6,71*3,68.7,71)
  g.setColor(255,255,255)
-----------------
end

function Menu.mousepressed(x,y,button,number)
  if button == 1 and x>420 and x<420+ds_x/18 and y>15 and y<15+ds_y/18 then
    if sound == sound_on then
      sound = sound_off
      musica:setVolume(0)
      somDoEngolir:setVolume(0)
      somDoAndar:setVolume(0)
    else
      sound = sound_on
      musica:setVolume(0.1)
      somDoEngolir:setVolume(0.1)
      somDoAndar:setVolume(0.15)
    end
  end
end
function Menu.update()
  down = love.mouse.isDown(1)
  love.mousepressed()
end


Menu.keyreleased = function(key)
end
function Menu.mousereleased(x,y,button)
  if (x_m>0 and x_m<dl_x/5) and (y_m>5 and y_m<5+dl_y/5)  then
    if button == 1 then
      stats.reset()
      Tela = stats
    end
  end
end
return Menu