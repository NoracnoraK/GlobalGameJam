extends KinematicBody2D

var vel = Vector2()
var speed = 200
var max_speed = 250
const GRAVITY = 1000
const ACCEL = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta): # execute 60 ticks par seconde
	vel.y += GRAVITY * delta
	
	movment_loop()
	
	move_and_slide(vel, Vector2(0, -1))
	pass
	
func movment_loop():
	var jump = Input.is_action_just_pressed("ui_up")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var dirx = int (right) - int(left)

	if dirx == -1:
		vel.x = max(vel.x - 5, -max_speed)
		$Sprite.flip_h = true
	elif dirx == 1:
		vel.x = min(vel.x + 5, max_speed)
		$Sprite.flip_h = false
	else:
		vel.x = lerp(vel.x, 0, 0.15)

	if jump == true and is_on_floor():
		vel.y = -400
