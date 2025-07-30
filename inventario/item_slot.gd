extends Panel
@onready var icon: TextureRect = $Icon
@export var trasparent = 0.5
@export var item: ItemData:
	set(value):
		item = value
		if is_node_ready() and item:
			update_ui()



func _ready() -> void:
	update_ui()

func update_ui() -> void:
	if not item:
		icon.texture = null
		return
	icon.texture = item.icon
	tooltip_text = item.item_name

func _get_drag_data(at_position: Vector2) -> Variant:
	if not item:
		return
	
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	preview.position -= Vector2(25,25)
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate ,trasparent)
	
	set_drag_preview(c)
	icon.hide()
	return self


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	if _data.item == item:
		prints("el elemento es true: ",item.item_name)
		#return true
	else:
		prints("el elemento es falso",_data)
		#return false
	return true




func _drop_data(at_position: Vector2, data: Variant) -> void:
	var temp = item
	item = data.item
	data.item = temp
	#data.texture = temp
	icon.show()
	data.icon.show()
	update_ui()
	data.update_ui()
	
