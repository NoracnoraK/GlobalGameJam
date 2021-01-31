extends Control

var coin = 0
var ruby = 0

func _ready():
	coin = -2

func _process(delta):
	$CanvasLayer/VBoxContainer/HBoxContainer/Label.text = str(coin)
	$CanvasLayer/VBoxContainer/HBoxContainer2/LabelRuby.text = str(ruby)


func _on_Scene01_crown_win(val):
	print ("Win")


func _on_Scene01_ruby_add(val):
	ruby += val


func _on_Scene01_coin_add(val):
	coin += val
