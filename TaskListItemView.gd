extends ColorRect
class_name TaskListItemView
static func instantiate() -> TaskListItemView:
    return load(
        "res://TaskListItemView.tscn"
    ).instance() as TaskListItemView


onready var _lbl_message = $Text
onready var _lbl_date = $DateLabel/Text
onready var _lbl_number = $Number


func set_data(message: String, date: String, number: int) -> void:
    _lbl_message.text = message
    # _lbl_date
    _lbl_number.text = str(number)
