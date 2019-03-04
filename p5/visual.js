var song;
var jumpS;
var thresholdS;
var amp;
var below = true;
var count = 0;
var volhistory = [];
var shots = [];
var h = 200;

function preload() {
	song = loadSound("../music/Hunger Games.mp3");
}

function setup() {
	createCanvas(500,500);
	createP("Jump");
	jumpS = createSlider(0,song.duration(),0);
	createP("Threshold");
	thresholdS = createSlider(0,10,8,1);
	song.play();
	amp = new p5.Amplitude();
	jumpS.changed(changeTime);
}

function draw() {
	var averageslope = 0;

	strokeWeight(1);
	background(0);
	stroke(255);
	fill(255);

	volhistory.push(500 * amp.getLevel());
	if (volhistory.length > 5)
		volhistory.splice(0,1);
	for (var i = 1; i < volhistory.length; i++)
		averageslope += volhistory[i] - volhistory[i - 1];
	averageslope = averageslope / (volhistory.length - 1);
	
	if (averageslope >= thresholdS.value()) {
		if (below) {
			spike();
		}
		below = false;
	}
	else
		below = true;

	line(0, height, width / 2, height / 2);
	line(width, height, width / 2, height / 2);
	line(width / 3, height, width / 2, height / 2);
	line(2 * width / 3, height, width / 2, height / 2);
	for (var i = 0; i < shots.length; i++) {
		strokeWeight(shots[i] * 10/height);
		point(width/2 - (width/2) * shots[i] / (height/2), shots[i] + height/2);
		point(width/2 - (width/6) * shots[i] / (height/2), shots[i] + height/2);
		point(width/2 + (width/6) * shots[i] / (height/2), shots[i] + height/2);
		point(width/2 + (width/2) * shots[i] / (height/2), shots[i] + height/2);

		strokeWeight(1);
		line(width/2 - (width/2) * shots[i] / (height/2), shots[i] + height/2, width/2 - (width/2) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		line(width/2 - (width/6) * shots[i] / (height/2), shots[i] + height/2, width/2 - (width/6) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		line(width/2 + (width/6) * shots[i] / (height/2), shots[i] + height/2, width/2 + (width/6) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		line(width/2 + (width/2) * shots[i] / (height/2), shots[i] + height/2, width/2 + (width/2) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		line(width/2 - (width/2) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2), width/2 - (width/6) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		line(width/2 + (width/2) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2), width/2 + (width/6) * shots[i] / (height/2), height/2 + shots[i] * (height/2 - h)/(height/2));
		shots[i] = shots[i] / 1.01;
	}

	//bottom left level bar	
	strokeWeight(1);
	fill(255,255,0);
	noStroke(0);
	rect(0, height - 5 * averageslope, 10, 5 * averageslope);
	stroke(255);
	line(0, height - 5 * thresholdS.value(), 10, height - 5 * thresholdS.value());
}

function changeTime() {
	song.jump(jumpS.value());
}

function spike() {
	if (count < 20) {
		shots.push(height/2);
		count++;
	}
	else
		shots[count++ % 20] = height/2;
}