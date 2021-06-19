package figures;

import openfl.display.Sprite;

class Ellipse extends Figure {
	private var a = Math.floor(Math.random() * 200);
	private var b = Math.floor(Math.random() * 180);

	public function new() {
		super();
		this.sprite.graphics.drawEllipse(0, 0, a, b);
	}

	public function calcArea() {
		return Math.floor(Math.PI * a * b);
	}
}
