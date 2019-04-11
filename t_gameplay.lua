-- Snake Game
gameplay = {}
g = love.graphics
t = require "tabuleiro"
gameplay.last_dir = "horizontal"
gameplay.contador = 0
gameplay.reset = function()
  arquivo.coordenaArquivo(Recorde,gameplay.contador,Coin)
  gameplay.last_dir = "horizontal"
  gameplay.contador = 0
  Snake_obj  = snake.create(Map_snake)
  scaleX = 1
  scaleY = 1
  pausar = false
  scalePauseNumbers = 3.9
  nPause = math.floor(scalePauseNumbers)
  startnPause = false
  estadoDeStun = false
  tempodestun = false
  estadoPause = false
end
gameplay.load = function()
  g.setBackgroundColor(0,0,0)
  g.setColor(128,128,128)
  gameplay.last_dir = ""
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
end
gameplay.update = function(dt)
    if delay >1 then
      if Snake_obj.corpo[1].x == tangerina.x and Snake_obj.corpo[1].y == tangerina.y or love.keyboard.isDown("r") then
        tangerina = engolir(Snake_obj.corpo,tangerina)
        scaleX = 1.5
        scaleY = 1.5
      end
      local last_dir = gameplay.last_dir
      t.limite(Snake_obj)
      mode = Tela
      if last_dir == "horizontal"  then
        if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
          somDoAndar:stop()
          somDoAndar:play()
          dir ={0,-1}
          gameplay.last_dir = "vertical"
        end
        if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
          somDoAndar:stop()
          somDoAndar:play()
          dir ={0,1}
          gameplay.last_dir = "vertical"
        end
      elseif last_dir == "vertical"  then
        if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
          somDoAndar:stop()
          somDoAndar:play()
          dir ={-1,0}
          gameplay.last_dir = "horizontal"
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
          somDoAndar:stop()
          somDoAndar:play()
          dir = {1,0}
          gameplay.last_dir = "horizontal"
        end 
      end
      if engMaca ~= 0 then
        engMaca = engMaca + 2
      end
      Snake_obj:mover(dir,Map_snake)
      delay = 0
    end
  
  delay = delay + 12 *dt
end
gameplay.draw = function()
  x_m,y_m = love.mouse.getPosition()
  g.push()
  g.translate(30,80-25)
  g.setColor(128,128,128)
  snake.desenhaSnake()
  macaEngolida(Snake_obj,engMaca)
  pontuacao()
  if startnPause then
    g.setColor(255,255,255,0.3)
    local tx,ty = imagenumbers:getDimensions()
    g.draw(imagenumbers,framenumbers[nPause],200-42*scalePauseNumbers/2,200-62*scalePauseNumbers/2,0,scalePauseNumbers/2,scalePauseNumbers/2)
  end
  g.pop()
  --bloco exit
  --g.rectangle("fill",25*16+5,0,50,50)
  g.setColor(255,255,255)

  if mouseover(x_m,y_m,{25*16+dla_x/12,25*17+dla_x/6},{5,dla_y/6+5}) then
      g.draw(leftarrow_w,25*16+dla_x/12,dla_y/12-5,0,1/6)
      if love.mouse.isDown(1) then
        gameplay.reset()
        Tela = Menu
        Menu.reset()
      end
  else
   g.draw(leftarrow_g,25*16+dla_x/12,dla_y/12-5,0,1/6)
  
  end
  
  --bloco exit
end

gameplay.mousepressed = function(x,y,button)
  if  (x >= 25*16+5 and x <= 25*16+55) and (y >= 0 and y <= 50) then
    voltarMenu()
    print("mousepressed")
  end
end
gameplay.keyreleased = function(key)
end
function gameplay.mousereleased(x,y,button)
end
return gameplay
