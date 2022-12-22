extends Control


onready var _ui_task_list = $ScrollContainer/VBoxContainer


func _ready() -> void:
    
    update_ui()


func update_ui() -> void:
    
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
