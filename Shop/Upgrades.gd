extends Tabs

func _process(delta):
	$RichTextLabel/ShopItems.position.x = -$HScrollBar.value
