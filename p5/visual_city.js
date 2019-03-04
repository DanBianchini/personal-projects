var song;
var lastTime = 0;
var sliderVol;
var sliderDiff;
var sliderJump;
//var sliderColor;
var amp;
var volhistory = [];
var ambient = 0;

function preload() {
  song = loadSound("../music/Hunger Games.mp3");
}

function setup() {
  createCanvas(500,500);
  createP('Volume');
  sliderVol = createSlider(0,1,1,0.01);
  createP('Difference');
  sliderDiff = createSlider(-300,300,0,1);
  createP('Jump');
  sliderJump = createSlider(0,song.duration(),0,0.01);
  sliderJump.changed(changeTime);
  //sliderColor = createSlider(); //add arguments
  song.play();
  amp = new p5.Amplitude();

  for (var i = 0; i < width / 2; i++) {
    volhistory.push(0);
  }
}

function draw() {
  background(255);
  song.setVolume(sliderVol.value());

  for (var i = 0; i < height; i++) {
    var col = map(i,0,height,0,150);
    if (song.currentTime() > lastTime) {
      ambient = map(song.currentTime(),0,song.duration(),0,255);
    }
    stroke(255 - ambient, col, ambient/3);
    line(0,i,width,i);
  }

  noStroke();
  fill(0);

  volhistory.push(amp.getLevel());

  if (volhistory.length > width / 2) {
    volhistory.splice(0,1);
  }

  beginShape();
  vertex(0, height);
  for (var i = 0; i < volhistory.length; i++) {
    var y = map(volhistory[i], 0, 1, height, -sliderDiff.value()) - 50;
    vertex(2 * i, y);
  }
  vertex(2 * (volhistory.length - 1), height);
  endShape();

  lastTime = song.currentTime();
}

function changeTime() {
  song.jump(sliderJump.value());
  lastTime = 0;
}