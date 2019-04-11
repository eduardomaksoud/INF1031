inicio = {}
inicio.reset = function()
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
  Map_snake = t.geraMap()
  Snake_obj  = snake.create(Map_snake)
  tangerina = t.gera_tangerina(Map_snake)
  pausar = false
  startnPause = false
  estadoDeStun = false
  tempodestun = false
  estadoPause = false
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
  dla_x,dla_y = leftarrow_g:getDimensions()
end
inicio.load = function()
  w.setTitle("Menu")
  font = g.newFont(18)
  Recorde = arquivo.checaArquivo("Recorde")
   print("inicio")
end
inicio.draw = function()
  x_m,y_m = love.mouse.getPosition()
  g.push()
  g.translate(30,80-25)
  g.setColor(128,128,128)
  Snake_obj  = snake.create(Map_snake)
  estadoDeStun = false
  snake.desenhaSnake()
  pontuacao()
  ---------------------------------------------------
  M.setColor(texto_minus,255,255,255)
  M.drawtext(texto_minus,200,200,"Pressione W,A,S,D para INICIAR")
  --------------------------------------------------
  g.pop()
  if mouseover(x_m,y_m,{25*16+dla_x/12,25*17+dla_x/6},{5,dla_y/6+5}) then
      g.draw(leftarrow_w,25*16+dla_x/12,dla_y/12-5,0,1/6)
      if love.mouse.isDown(1) then
        gameplay.reset()
        voltarMenu()
      end
  else
   g.draw(leftarrow_g,25*16+dla_x/12,dla_y/12-5,0,1/6)
  
  end
end
inicio.update = function(dt)
      if love.keyboard.isDown("up") or love.keyboard.isDown("w")then
        gameplay.reset()
        Tela = gameplay
        dir = {0,1}
      end
      if love.keyboard.isDown("down") or love.keyboard.isDown("s")then
        gameplay.reset()
        Tela = gameplay
        dir = {0,-1}
      end
      if love.keyboard.isDown("left") or love.keyboard.isDown("a")then
        gameplay.reset()
        Tela = gameplay
        dir = {-1,0}
      end
      if love.keyboard.isDown("right") or love.keyboard.isDown("d")then
        gameplay.reset()
        Tela = gameplay
        dir = {-1,0}
    end
end
inicio.keyreleased = function(key)
 gameplay.reset()
end
inicio.mousepressed = function(x,y,button)
end
function inicio.mousereleased(x,y,button)
end
return inicio