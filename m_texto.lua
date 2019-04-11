M  =  {}
  function  M.new  (font,s)
    local  obj  =  { text  =  g.newText( font ,""),
      str  =  s  or  "" ,
      color  =  {0 ,0 ,0} ,
      angle  =  0,
      anchor  =  "no" ,
      width  =  nil ,
      align  =  "left" ,
      fill  =  false ,
      fillcolor  =  {255 ,255 ,255} ,
      line  =  false ,
      linecolor  =  {0 ,0 ,0} ,
}
      return  obj
end
  function  M.setRotation  (obj ,  value )
    obj.angle  =  value * math.pi /180
  end
  function  M.setColor(obj,r,g, b)
      obj.color  =  {r,g,b}
  end
  function M.setf(obj,fonte)
    love.graphics.setFont(fonte)
  end
local  function  computeOffset  ( anchor , w ,  h)
    if  anchor  ==  " no "  then
      return  0,  0
    elseif  anchor  ==  "n"  then
      return  w/2 ,  0
    elseif  anchor  ==  " ne "  then
      return  w ,  0
    elseif  anchor  ==  "o"  then
      return  0,  h /2
    elseif  anchor  ==  "c"  then
      return  w/2 ,  h /2
    elseif  anchor  ==  "e"  then
      return  w ,  h /2
    elseif  anchor  ==  " so "  then
      return  0,  h
    elseif  anchor  ==  "s"  then
      return  w/2 ,  h
    elseif  anchor  ==  " se "  then
      return  w ,  h
    end
end
function  M.drawtext(obj,x,y,z)
    if  not  obj.width  then
      obj.text:set(z)
    else
      obj.text:setf (obj.str,obj.width,obj.align )
    end
    local  w  =  obj.width  or  obj.text:getWidth ()
    local  h  =  obj.text:getHeight ()
    local  ox,oy  =  computeOffset ( obj.anchor ,w ,h)
    local tx,ty = obj.text:getDimensions()
    g.push ()
    g.translate (x,y)
    g.rotate ( obj.angle )
    g.translate (-x ,-y)
    if  obj.fill  then
      g.setColor ( obj.fillcolor[1], obj.fillcolor[2] , obj.fillcolor[3])
      g.rectangle ("fill" ,x -ox ,y -oy ,w ,h)
    end
    g.pop ()
    g.setColor ( obj.color [1] , obj.color[2] , obj.color[3])
    g.draw ( obj.text,x-tx/2,y-ty/2,obj.angle ,1 ,1 , ox , oy )
   end


return M