extends KinematicBody2D
export var hit_points = 5
var immune = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.play()
	position.x = 500
	position.y = 500
	pass # Replace with function body.
	
func take_damage():
	if !immune:
		hit_points -= 1
	immune = true
	$AnimatedSprite.animation = "damaged"
	$ImmuneFrames.start()

func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ImmuneFrames_timeout():
	$AnimatedSprite.animation = "idle"
	immune = false
	pass # Replace with function body.
