extends Area2D

export (Texture) var defaultSprite
export (Texture) var brokenSprite
export var strength= 1


func _ready():
	add_to_group("blocks")
	$Sprite.texture = defaultSprite

func hit():
	strength-=1
	$Sprite.texture = brokenSprite
	if strength < 0:
		queue_free()

