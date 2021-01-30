extends KinematicBody2D

var vel = Vector2()
export (int) var speed = 50
export (int) var max_speed = 100
export (int) var dirx = -1

const GRAVITY = 1000
const ACCEL = 6
const UP = Vector2(0, -1)

func _on_Timer_timeout():
	if is_on_wall():
		dirx *= -1
	pass # Replace with function body.

func _physics_process(delta): # execute 60 ticks par seconde
	movment_loop()
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, UP)
	pass
	
func movment_loop():
	if dirx == -1:
		vel.x = max(vel.x - ACCEL, -max_speed)
		$Sprite.flip_h = false
		$AnimationSpider.play("walk")
	elif dirx == 1:
		vel.x = min(vel.x + ACCEL, max_speed)
		$Sprite.flip_h = true
		$AnimationSpider.play("walk")
