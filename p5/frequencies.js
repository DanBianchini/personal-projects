var song;
var slider;
var fft;

function preload() {
  song = loadSound("Pompeii.mp3");
}

function setup() {
  createCanvas(256,256);
  slider = createSlider(0,1,1,0.01);
  fft = new p5.FFT(0,256);
  song.play();
}

function draw() {
  background(0);
  stroke(255);
  song.setVolume(slider.value());
  
  var spectrum = fft.analyze();

  for (var i = 0; i < spectrum.length; i++) {
    var amp = spectrum[i];
    var y = map(amp,0,256,height,0);
    line(i, height, i, y);
  }
}