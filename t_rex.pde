PImage trex, cactus1, cactus2, bird, trexd;
float posX, posY, velX, velY, accX, accY;
float g = 0.40;
int ccactusX = 1000, cactusX = 700, birdX, birdY;
float score, highscore;
boolean gameOver = false, down = false;

void setup() {
  size(600, 600);
  trex = loadImage("trex.png");
  cactus1 = loadImage("cactus.png");
  cactus2 = loadImage("cactus.png");
  bird =  loadImage("bird.png");
  trexd = loadImage("trexd.png");
  posX = width / 2;
  posY = height -71;
  velX = 0;
  velY = 0;
  accX = 0;
  accY = 0;
  score = 0;
  highscore = 0;
  birdX = 600;
  birdY = 540;
}
void draw() { 
  if (!gameOver) {
    background(255);
    fill(0);
    velY += g;
    posY += velY;
    image(cactus2, ccactusX, height - cactus2.height- 1); 
    image(cactus1, cactusX, height - cactus1.height - 1);

    ccactusX-=5;
    cactusX-=5;
    birdX -=4;
    score +=0.08;

    if (ccactusX <= 0) {
      ccactusX = 700;
    }
    if (cactusX <= 0) {
      cactusX = 800;
    }
    if (birdX <= 0) {
      birdX = 1000;
    }
    if (posY >= height - 71) {
      posY = height - 71;
      velY -= g;
    }
   if (get((int)posX, (int)posY + 70) == color(0, 0, 0)) {
      gameOver = true;
    }
  if (get((int)posX, (int)posY) == color(0, 0, 0)) {
    gameOver = true;
  }
  if (get((int)posX + 70, (int)posY) == color(0, 0, 0)) {
    gameOver = true;
  }
  if (get((int)posX + 70, (int)posY + 70) == color(0, 0, 0)) {
    gameOver = true;
  }
  if (!down) {
    image(trex, posX, posY, 70, 70);
  }
  println(posX, posY);
  text("Score: " +(int) score, 300, 300);
  if (down) {
    image(trexd, posX, posY, 70, 70);
  }
  if (keyPressed && keyCode == DOWN) { 
    down = true;
  } else {
    down = false;
  }
  if (score >= 50) {
    fill(0);
    image(bird, birdX, birdY);
  }
}
if (gameOver) {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Je score was: " +(int) score, width / 2, height / 2);
  text("Je highscore is: " +(int) highscore, 300, height / 2 + 40);
  text("Druk op R om te restarten", 300, height / 2 - 40);
}
if (score >= highscore) {
  highscore = score;
}
}


void keyPressed() {
  if (keyCode == UP && posY >= height - 71) {
    velY = -10;
  }
  if (keyCode == 'R' && gameOver == true) {
    gameOver = false;
    score = 0;
    ccactusX = 1000;
    cactusX = 700;
  }
}
