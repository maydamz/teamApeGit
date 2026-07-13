extends RichTextLabel

const textSpeed: float = 1.5
func _ready() -> void:
	visible_ratio = 0.0
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(
		self,
		"visible_ratio",
		1.0,
		textSpeed
	)
