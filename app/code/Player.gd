extends KinematicBody2D

var vel = Vector2()
var speed = 200
var max_speed = 250
var starting_position

const GRAVITY = 1000
const ACCEL = 6
const UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
   starting_position = position

func respawn():
   position = starting_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta): # execute 60 ticks par seconde
	movment_loop()
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, UP)
	pass
	
func movment_loop():
	var jump = Input.is_action_just_pressed("ui_up")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var dirx = int (right) - int(left)

	if dirx == -1:
		vel.x = max(vel.x - ACCEL, -max_speed)
		$Sprite.flip_h = false
		$AnimationPlayer.play("walk")
	elif dirx == 1:
		vel.x = min(vel.x + ACCEL, max_speed)
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")
	else:
		vel.x = lerp(vel.x, 0, 0.15)
		$AnimationPlayer.play("idle")

	if jump == true and is_on_floor():
		vel.y = -500

	if vel.y < 0:
		$AnimationPlayer.play("jump")
	if vel.y > 0:
		$AnimationPlayer.play("jump")	

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "spider" or collision.collider.name == "Spikes":
			$AnimationPlayer.play("death")
			set_physics_process(false)
