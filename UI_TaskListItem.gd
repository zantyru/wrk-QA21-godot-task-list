extends ColorRect
class_name UI_TaskListItem
static func instantiate() -> UI_TaskListItem:
    return load(
        "res://UI_TaskListItem.tscn"
    ).instance() as UI_TaskListItem


onready var _ui_message: Label = $Text
onready var _ui_date: Label = $DateLabel/Text
var _task: Task = null


func _ready() -> void:
    
    if _task == null:
        return
    
    _ui_message.text = _task.message
    _ui_date.text = _task.creation_date_string
    _task = null


func set_data(task: Task) -> void:
    
    # Этот метод может быть выполнен ещё до окончательного размещения данного
    # узла в дереве узлов, то есть ещё до вызова метода _ready
    
    _task = task
