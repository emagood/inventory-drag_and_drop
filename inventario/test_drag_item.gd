extends Panel
@export var acept_type = "test"


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return false
