extends Sprite2D

var velocity=Vector2(1,0)
var speed = 250 
var look_once= true

func _process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once=false
		global_position += velocity.rotated(rotation) * speed * delta
 
