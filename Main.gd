extends Control


onready var _ui_task_list: VBoxContainer = $ScrollContainer/VBoxContainer
onready var _ui_set_date_button: Button = $DateControlButtons/SetDateButton


func _ready() -> void:
    
    update_ui()


func update_ui() -> void:
    
    _ui_set_date_button.text = Time.get_datetime_string_from_system().split("T")[0]
    
    for child in _ui_task_list.get_children():
        _ui_task_list.remove_child(child)
        child.queue_free()
    
    var ui_task: UI_TaskListItem
    
    for task in G.tasks:
        ui_task = UI_TaskListItem.instantiate()
        ui_task.set_data(task)
        _ui_task_list.add_child(ui_task)


func _on_Button_pressed() -> void:
    
    var _e: int
    _e = get_tree().change_scene("res://CreateTask.tscn")
