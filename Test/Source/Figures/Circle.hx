package figures;

import openfl.display.Sprite;

class Circle extends Figure {
	public function new() {
		super();
		this.sprite.graphics.drawCircle(0, 0, randomRadius(20, 80));
	}

	public function calcArea() {
		return Math.floor((Math.PI * randomRadius(20, 80)) * 2);
	}

	private function randomRadius(min, max) {
		var rand = min + Math.random() * (max + 1 - min);
		return Math.floor(rand);
	}
}
