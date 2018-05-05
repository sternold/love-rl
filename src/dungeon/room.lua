local Room =  class('room')
function Room:initialize(x, y, w, h)
    self.x1 = x
    self.y1 = y
    self.x2 = x + w
    self.y2 = y + h
end

function Room:center()
    cx = util.division((self.x1 + self.x2), 2)
    cy = util.division((self.y1 + self.y2), 2)
    return cx, cy
end

function Room:intersect(other)
    return (self.x1 <= other.x2 
    and self.x2 >= other.x1 
    and self.y1 <= other.y2 
    and self.y2 >= other.y1)
end
return Room