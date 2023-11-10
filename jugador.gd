extends AnimatedSprite2D

var speed = 200
var dash_distance = 150  
var is_dashing = false
var dash_timer = 0.1
var current_dash_timer = 0

var bullet = preload("res://bullet.tscn")

func _process(delta):
	var velocity = Vector2()  
	
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	velocity = velocity.normalized()
	
	if velocity.x < 0:
		scale.x = -2
	elif velocity.x > 0:
		scale.x = 2
	
	if velocity == Vector2(0, 0):
		play("quieta")
	else:
		play("mover")
	
	
	if Input.is_action_just_pressed("dash") and not is_dashing:
		is_dashing = true
		current_dash_timer = dash_timer
		var dash_vector = velocity * dash_distance
		global_position += dash_vector
		
	if is_dashing:
		current_dash_timer -= delta
		if current_dash_timer <= 0:
			is_dashing = false
	if not is_dashing:
		global_position += speed * velocity * delta
		
	if Input.is_action_just_pressed("fire") and Global.node_creation_parent != null:
		Global.instance_node(bullet,global_position,Global.node_creation_parent)

