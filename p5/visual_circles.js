var song;
var jumpS;
var thresholdS;
var amp;
var below = true;
var cycle = 0;

function preload() {
	song = loadSound("Africa.mp3");
}

function setup() {
	createCanvas(500,500);
	createP("Jump");
	jumpS = createSlider(0,song.duration(),0);
	createP("Threshold");
	thresholdS = createSlider(0,100,35,5);
	song.play();
	amp = new p5.Amplitude();
	jumpS.changed(changeTime);
	background(0);
}

function draw() {
	stroke(255);
	fill(255);

	if (250 * amp.getLevel() > thresholdS.value()) {
		if (below) {
			spike();
			cycle++;
		}
		below = false;
	}
	else
		below = true;

	fill(0);
	noStroke();
	rect(0, height - 70, 10, 70);
	fill(255,255,0);
	noStroke(0);
	rect(0, height - 250 * amp.getLevel(), 10, 250 * amp.getLevel());
	stroke(255);
	line(0, height - thresholdS.value(), 10, height - thresholdS.value());
}

function changeTime() {
	song.jump(jumpS.value());
}

function spike() {
	if (cycle % 3 == 0)
		fill(255,0,0);
	else if (cycle % 3 == 1)
		fill(0,255,0);
	else
		fill(0,0,255);
	noStroke();

	ellipse(random(width), random(height), random(10,50));
}