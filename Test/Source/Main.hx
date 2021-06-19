package;

import js.Browser;
import js.html.InputElement;
import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import haxe.Timer;
import Animation;
import FiguresFactory;
import figures.Figure;

class Main extends Sprite {
	static inline final FIGURES_PER_SECOND = "figures per second = ";

	private var widthScreen = Lib.current.stage.stageWidth;
	private var heightScreen = Lib.current.stage.stageHeight;

	private var anim:Animation;
	private var timer:Timer;
	private var figFactory:FiguresFactory;
	private var randomFigure:Figure;
	private var arrCurrentFigures:Array<Sprite> = [];
	private var numFigurePerSec:Int;

	public function new() {
		super();
		this.numFigurePerSec = 1;
		this.figFactory = new FiguresFactory();
		this.anim = new Animation();
		anim.fallDown(this.arrCurrentFigures);
		clickBtnSpeed();
		timerForFigurePerSec();
		clickBtnForFigurePerSec();
		stage.addEventListener(MouseEvent.CLICK, clickAddFig);
	}

	private function runFigure() {
		var randomFigure:Figure = figFactory.getRandomFigure();
		var sprite = randomFigure.getSprite();
		clickAnimationFigure(sprite);
		var value = cast(Browser.document.getElementById('data'), InputElement).value = "area of the figure " + randomFigure.calcArea();
	}

	private function clickAddFig(e:Event):Void {
		runFigure();
	}

	private function clickBtnSpeed() {
		var plus = Browser.document.getElementById("increaseSpeed");
		plus.onclick = (event) -> anim.increaseSpeed();
		var minus = Browser.document.getElementById("reduceSpeed");
		minus.onclick = (event) -> anim.reduceSpeed();
	}

	private function showIntervalPerSec() {
		for (i in 0...numFigurePerSec) {
			var randomFigure:Figure = figFactory.getRandomFigure();
			var sprite = randomFigure.getSprite();
			sprite.y = -Math.floor(Math.random() * (this.heightScreen + 540));
			sprite.x = Math.floor(Math.random() * this.widthScreen);
			clickAnimationFigure(sprite);
		}
		var value = cast(Browser.document.getElementById('data-two'), InputElement).value = FIGURES_PER_SECOND + numFigurePerSec;
	}

	private function clickAnimationFigure(sprite:Sprite):Void {
		addChild(sprite);
		this.arrCurrentFigures.push(sprite);
		sprite.addEventListener(MouseEvent.MOUSE_DOWN, function(e) {
			sprite.parent.removeChild(sprite);
			arrCurrentFigures.remove(sprite);
		});
	}

	private function timerForFigurePerSec() {
		var timer = new Timer(1000);
		timer.run = showIntervalPerSec.bind();
	}

	private function clickBtnForFigurePerSec() {
		var plus = Browser.document.getElementById("increaseFigure");
		plus.onclick = (event) -> numFigurePerSec++;
		var minus = Browser.document.getElementById("reduceFigure");
		minus.onclick = (event) -> clickReduceFigPerSecond();
	}

	private function clickReduceFigPerSecond() {
		if (numFigurePerSec == 0) {
			return;
		} else
			numFigurePerSec--;
	}
}
