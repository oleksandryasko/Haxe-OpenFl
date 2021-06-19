package figures;

import openfl.display.Sprite;

class Rectangle extends Figure {
	private var rectHeightArea = Math.floor(Math.random() * 200);
	private var rectWidhtArea = Math.floor(Math.random() * 260);

	public function new() {
		super();
		this.sprite.graphics.drawRect(0, 0, rectHeightArea, rectWidhtArea);
	}

	public function calcArea() {
		return rectHeightArea * rectWidhtArea;
	}
}
