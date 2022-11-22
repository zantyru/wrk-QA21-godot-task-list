extends Control


class TaskDescription:
    var text := ""


onready var _task_text_input = $TaskTextInput
onready var _tasks_gui_container = $ScrollContainer/VBoxContainer


var _tasks: Array = []



func _on_Button_pressed() -> void:
    var text: String = _task_text_input.text.strip_edges()
    
    if not text:
        return
        
    _task_text_input.text = ""
    
    var task_desc := TaskDescription.new()
    task_desc.text = text
    _tasks.append(task_desc)
    
    var task_list_item_view := TaskListItemView.instantiate()
    _tasks_gui_container.add_child(task_list_item_view)
    
    print(task_list_item_view.message)
#    task_list_item_view.message.text = task_desc
