extends Panel
@onready var icon: TextureRect = $Icon
@export var trasparent = 0.5
@export var acept_type = ""
@export var rect = Vector2(25,25)
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
	tooltip_text = item.item_name +" "+ item.type

func _get_drag_data(at_position: Vector2) -> Variant:
	if not item:
		return
	
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	preview.position -= rect
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate ,trasparent)
	
	set_drag_preview(c)
	icon.hide()
	return self


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	if _data.item.type != acept_type:
		#prints("",_data.item.item_name)
		Dragitem.typeitem = _data.item.type
		prints("haceptamos tododdd",_data.item.type + "  " ,acept_type )
		return false
	##else:
		##prints("el elemento es falso",_data)
		###return false
	##return true
	if acept_type  == "":#
		return true
	if _data.item.type == acept_type :#Dragitem.typeitem
		prints("es de tipo ok ac" + acept_type)
		return true
	elif acept_type == _data.acept_type :
		prints("no es de tipo f  ac " + acept_type)
		return true
	prints("no es de tipo f2 ac " + acept_type)
	return false




func _drop_data(at_position: Vector2, data: Variant) -> void:
	var temp = item
	prints(data.item.type)
	if acept_type == data.item.type:
		#
		prints("haceptamos todo",data.item.type + "  " ,acept_type )
	#else:

	else:
		if data.acept_type != acept_type and item == null:
			prints("no es de tipo name nada  ac" + data.acept_type)
		
			icon.show()
			data.icon.show()
			return
		prints("ok")

	prints("tipo name  ac " + data.acept_type)
	item = data.item
	data.item = temp
	#data.texture = temp
	icon.show()
	data.icon.show()
	update_ui()
	data.update_ui()


	prints("fin drop ac ")
