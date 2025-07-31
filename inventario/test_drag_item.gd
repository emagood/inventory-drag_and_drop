extends Panel
@export var acept_type = "test"


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	if Dragitem.typeitem == acept_type:
		prints("es de tipo " + acept_type)
		return true
	prints("no es de tipo " + acept_type)
	return false
