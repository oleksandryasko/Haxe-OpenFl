package figures;

import openfl.display.Sprite;

class Triangle extends Figure {
	private var triangleHeight = Math.floor(Math.random() * 210);

	public function new() {
		super();
		this.sprite.graphics.lineStyle(2, 0x000000);
		this.sprite.graphics.moveTo(triangleHeight / 2, 0);
		this.sprite.graphics.lineTo(-60, 0);
		this.sprite.graphics.lineTo(0, triangleHeight);
	}

	public function calcArea() {
		return Math.floor((triangleHeight * triangleHeight) / 1.73);
	}
}
