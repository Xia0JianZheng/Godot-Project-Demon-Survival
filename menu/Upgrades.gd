extends Tabs

func _process(delta):
	$RichTextLabel/control.position.x = -$HScrollBar.value
