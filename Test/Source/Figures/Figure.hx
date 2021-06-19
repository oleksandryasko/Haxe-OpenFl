package figures;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.events.MouseEvent;
import Main;

abstract class Figure {
	private var sprite:Sprite;
	private var widthScreen = Lib.current.stage.stageWidth;
	private var heightScreen = Lib.current.stage.stageHeight;
	private var colors = [
		0xFFFF0B, 0xFF700B, 0x4286f4, 0x4286f4, 0xf441e8, 0x8dff6d, 0x41ccc9, 0xe03375, 0x95e032, 0x77c687, 0x43ba5b, 0x0ea3ba
	];

	var currentMouseX = Std.is(Lib.current.stage.mouseX, Float) ? Lib.current.stage.mouseX : 0;
	var currentMouseY = Std.is(Lib.current.stage.mouseY, Float) ? Lib.current.stage.mouseY : 0;

	public function new() {
		this.sprite = new Sprite();
		this.sprite.graphics.lineStyle(2, 0x000000);
		setRandomColor();
		setPosition();
	}

	public abstract function calcArea():Int;

	public function getSprite():Sprite {
		return sprite;
	};

	private function setRandomColor() {
		var randCol = Math.floor(Math.random() * this.colors.length);
		this.sprite.graphics.beginFill(this.colors[randCol], 1);
	}

	private function stageMouseMove(e:MouseEvent):Void {
		this.currentMouseX = Math.floor(e.localX);
		this.currentMouseY = Math.floor(e.localY);
	}

	private function setPosition() {
		this.sprite.x = currentMouseX;
		this.sprite.y = currentMouseY;
	}
}
