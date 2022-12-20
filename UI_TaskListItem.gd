extends ColorRect
class_name UI_TaskListItem
static func instantiate() -> UI_TaskListItem:
    return load(
        "res://UI_TaskListItem.tscn"
    ).instance() as UI_TaskListItem


onready var _ui_message = $Text
onready var _ui_date = $DateLabel/Text
var _task: Task = null


func _ready() -> void:
    
    if _task == null:
        return
    
    _ui_message.text = _task.message
    _ui_date = _task.creation_date_string
    _task = null


func set_data(task: Task) -> void:
    
    _task = task
