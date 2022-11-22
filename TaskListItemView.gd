extends ColorRect
class_name TaskListItemView
static func instantiate() -> TaskListItemView:
    return load(
        "res://TaskListItemView.tscn"
    ).instance() as TaskListItemView


onready var message = $Text
onready var date_label = $DateLabel/Text
