extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 250
	position.y = 250 
	$AnimatedSprite.play()
	pass # Replace with function body.

func _process(delta):
	var direction = Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")), int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))).normalized()
	if direction.length():
		if direction.x:
			$AnimatedSprite.flip_h = direction.x < 0
		$AnimatedSprite.animation = "run"
		position += direction * speed * delta
	elif Input.is_action_pressed("ui_accept"):
		$AnimatedSprite.animation = "attack"
	else:
		$AnimatedSprite.animation = "idle"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	print("test")
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print("test")
	body.take_damage()
	pass # Replace with function body.
