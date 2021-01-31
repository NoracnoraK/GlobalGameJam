extends Area2D

signal ruby_collected(body)

var textures = {
	'Coin' : "res://Item/MonedaD.png",
	'Ruby' : "res://Item/spr_coin_roj.png",
	'Crown': "res://Item/Crown spritesheet.png"
}

var _type

func init(type, pos):
	_type = type
	$Sprite.texture = load(textures[_type])
	position = pos

func _physics_process(delta):
	$AnimationPlayer.play("Shine")


func _on_Area2D_body_entered(body):
	$CollisionShape2D.disabled = true
	emit_signal("ruby_collected", _type)
	queue_free()
