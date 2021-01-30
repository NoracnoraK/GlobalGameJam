extends KinematicBody2D

var vel = Vector2()
var speed = 200
const GRAVITY = 1000
const ACCEL = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta): # execute 60 ticks par seconde
	vel.x = 0
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
		vel.x -= speed
	elif dirx == 1:
		vel.x += speed
		vel.x = min(vel.x + 5, speed)
	else:
		vel.x = 0

	if jump == true and is_on_floor():
		vel.y = -300
