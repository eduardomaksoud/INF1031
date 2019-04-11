-- snake.lua
snake = {}
local cobra ={
  corpo = { {x=0,y=0,frame = 3},{x=0,y=0,frame = 1},{x=0,y=0,frame = 7}},
  mover = function(obj,dir,Map)--{0,1}
    if dir[1] == 0 and dir[2] ==0 then
  else
    checa_pos = (obj.corpo[1].x+dir[1])*t.px + obj.corpo[1].y-dir[2]
    nx = obj.corpo[1].x+dir[1]
    ny = obj.corpo[1].y-dir[2]
    --checa_pos == (obj.corpo[#obj.corpo].x*t.px +obj.corpo[#obj.corpo].y) then
    cabeca_frame = cabeca_image(obj.corpo[1],dir)
    testeProximaPosicao = {corpo={{x=obj.corpo[1].x+dir[1],y=obj.corpo[1].y-dir[2],frame = cabeca_frame}}}
    if not t.limite(testeProximaPosicao) then
      return
    end
    
    if not Map[nx][ny] then
      tempodestun = 5
      estadoDeStun = true
      return
    end
    t.limite(testeProximaPosicao)
    table.insert(obj.corpo,1,{x=obj.corpo[1].x+dir[1],y=obj.corpo[1].y-dir[2],frame = cabeca_frame})
    corpo_frame = corpo_image(obj,dir)
    obj.corpo[2].frame = corpo_frame 
    Map[obj.corpo[1].x][obj.corpo[1].y] = false
    
    Map[(obj.corpo[#obj.corpo].x)][(obj.corpo[#obj.corpo].y)]= true 
    obj.corpo[#obj.corpo] = nil
    end
  end,
  atordoado = function(obj,dt)
    tempodestun = tempodestun - 5*dt
    pausar = true
    scaleNumberx = 1.5
    scaleNumbery = 1.5
    if tempodestun <= 0 then
      inicio.reset()
      Tela = inicio
    end
  end
  
  }
cabeca_image = function(obj,dir)
    c_x= obj.x + dir[1]
    c_y = obj.y - dir[2]
    p_x = obj.x 
    p_y = obj.y
    if c_x < p_x then
      return 3
    end
    if c_x >p_x then
      return 4
    end
    if c_y > p_y then
      return 5
    end
    if c_y < p_y then
      return 2
    end
  end
corpo_image = function(obj,dir)
  c_x = obj.corpo[1].x
  c_y = obj.corpo[1].y
  p_x = obj.corpo[2].x
  p_y = obj.corpo[2].y
  d_x = c_x - p_x
  d_y = c_y - p_y
  if d_x ~= 0 then
    if d_x<0 then
      if obj.corpo[3].y < p_y then
        return 14
      end
      if obj.corpo[3].y > p_y then
        return 11
      end
      return 1
    end
    if d_x>0 then
      if obj.corpo[3].y < p_y then
        return 13
      end
      if obj.corpo[3].y > p_y then
        return 12
      end
        return 1
    end--d_x<0
  end
  if d_y ~= 0 then
    if d_y<0 then
      if obj.corpo[3].x > p_x then
        return 13
      end
      if obj.corpo[3].x < p_x then
        return 14
      end
    return 10
    end
    if d_y > 0 then
      if obj.corpo[3].x > p_x then
        return 12
      end
      if obj.corpo[3].x < p_x then
        return 11
      end
      return 10
    end
  end
 
end  
snake.viraCalda = function(c,prec)
  local x = c.frame
  local y = prec.frame                                                                                               
  if x == 10 and y == 11 then
    return 6
  end
  if x==10 and y ==14 then
     return 9
  end
  if x == 10 and y == 12 then
    return 6
  end
  if x== 10 and y == 13 then
    return 9
  end
---------------------------------------
  if x == 1 and y == 11 then
    return 8
  end
  if x==1 and y ==12 then
    return  7
  end
  if x == 1 and y == 13 then
    return 7
  end
  if x== 1 and y == 14 then
    return 8
  end
  vc_x = c.x
  vc_y = c.y
  vpc_x = prec.x
  vpc_y = prec.y

  if vc_x > vpc_x then
    return 7
  end
  if vc_x < vpc_x then
    return 8
  end
  if vc_y > vpc_y then
    return 6
  end
  if vc_y < vpc_y then
    return 9
  end
  return 9
end
snake.desenhaSnake = function()
  --[[cabeca S
  --frames[5] = g.newQuad(100,25,25,25,imageFile:getDimensions())
   --cabeca N
  frames[2] = g.newQuad(75,0,25,25,imageFile:getDimensions())
  --cabeca W
  frames[3] = g.newQuad(75,25,25,25,imageFile:getDimensions())
  --cabeca E
  frames[4] = g.newQuad(100,0,25,25,imageFile:getDimensions())]]
  desenhaGrid()
  for k=1,#Snake_obj.corpo,1 do
    v = Snake_obj.corpo[k]
    if k == 1 then
      if tempodestun and estadoDeStun then
        g.draw(imageFile,frames[v.frame],v.x*t.tam_quad(1),v.y*t.tam_quad(2),0,1,1)
        cabecaAtordoada()
      else
        g.draw(imageFile,frames[v.frame],v.x*t.tam_quad(1),v.y*t.tam_quad(2),0,1,1)
      end
    elseif k == #Snake_obj.corpo  then
      v.frame = snake.viraCalda(v,Snake_obj.corpo[(#Snake_obj.corpo)-1])
      g.draw(imageFile,frames[v.frame],v.x*t.tam_quad(1),v.y*t.tam_quad(2),0,1,1)
    else
      
      g.draw(imageFile,frames[v.frame],v.x*t.tam_quad(1),v.y*t.tam_quad(2),0,1,1)
   end
  end
  g.setColor(255,255,255)
  g.draw(imageFile,frames[18],tangerina.x*t.tam_quad(1),tangerina.y*t.tam_quad(2),0,1,1)
end
function snake.create(Map_snake)
  Sox = 6
  Soy = 6
  local s = { corpo={{x=Sox,y=Soy,frame = 3},{x=Sox+1,y=Soy,frame = 1},{x=Sox+2,y=Soy,frame = 1},{x=Sox+3,y=Soy,frame = 7}}}
  Map_snake[Sox][Soy] = false
  Map_snake[(Sox+1)][Soy] = false
  Map_snake[(Sox+2)][Soy] = false
  Map_snake[(Sox+3)][Soy] = false
  setmetatable(s,{__index =cobra })
  return s
end
function engolir(obj,comida)
    comida = t.gera_tangerina(Map_snake)
    obj[#obj+1] = {x=obj[#obj].x,y = obj[#obj].y}
    gameplay.contador = gameplay.contador + 1
    somDoAndar:stop()
    somDoEngolir:stop()
    somDoEngolir:play()
    engMaca = 2
    return comida
end
function desenhaGrid()
  for i = 0,t.px do
    for n = 0,t.py do
      g.rectangle("line",i*t.tam_quad(1),n*t.tam_quad(2),t.tam_quad(1),t.tam_quad(2))
    end
  end
end

function cabecaAtordoada()
  local tx,ty = stun:getDimensions()
        if v.frame == 5 then
          g.draw(stun,v.x*t.tam_quad(1)+tx,v.y*t.tam_quad(2)+ty*5/2.1,0,1.5,1.5)
          g.draw(stun,v.x*t.tam_quad(1)+tx*5/2,v.y*t.tam_quad(2)+ty*5/2.1,0,1.5,1.5)
        elseif v.frame == 2 then
          g.draw(stun,v.x*t.tam_quad(1)+tx,v.y*t.tam_quad(2)+ty*2/1.5,0,1.5,1.5)
          g.draw(stun,v.x*t.tam_quad(1)+tx*5/2,v.y*t.tam_quad(2)+ty*2/1.5,0,1.5,1.5)
        elseif v.frame == 4 then
          g.draw(stun,v.x*t.tam_quad(1)+t.px-tx,v.y*t.tam_quad(2)+ty*2/1.5,0,1.5,1.5)
          g.draw(stun,v.x*t.tam_quad(1)+t.px-tx,v.y*t.tam_quad(2)+ty*4/1.5,0,1.5,1.5)
        elseif v.frame == 3 then
          g.draw(stun,v.x*t.tam_quad(1)+tx*2/1.5,v.y*t.tam_quad(2)+ty*2/1.5,0,1.5,1.5)
          g.draw(stun,v.x*t.tam_quad(1)+tx*2/1.5,v.y*t.tam_quad(2)+ty*4/1.5,0,1.5,1.5)
        end
end
return snake
