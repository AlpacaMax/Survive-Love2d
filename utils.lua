function getDistance(x1, y1, x2, y2)
    return math.sqrt((x1-x2)^2 + (y1-y2)^2)
end

function checkCollision(gameObjA, gameObjB)
    return getDistance(gameObjA.x, gameObjA.y, gameObjB.x, gameObjB.y) 
         < gameObjA.radius + gameObjB.radius
end