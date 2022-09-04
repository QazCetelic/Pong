int paddleHeight = 100;
int paddleWidth = 15;
int ballSize = 15;
int rightPaddleSpeed = 3;

int leftPaddleX;
int leftPaddleY;
int rightPaddleX;
int rightPaddleY;
int ballX;
int ballY;
int ballVelocityX;
int ballVelocityY;
int ballSpeed = 5;
int score = 0;

void setup() {
  size(500, 500);
  leftPaddleX = (int) (width * 0.05);
  leftPaddleY = (height / 2) - (paddleHeight / 2);
  
  rightPaddleX = (int) (width * 0.95);
  rightPaddleY = (height / 2) - (paddleHeight / 2);
  
  // Zet bal in het midden van scherm
  ballX = width / 2;
  ballY = height / 2;
  
  // Schiet bal naar links onder
  ballVelocityX = -1;
  ballVelocityY = 1;
}

void draw() {
  ballSpeed = max(5, score);
  leftPaddleY = mouseY - (paddleHeight / 2);
  if (ballVelocityY > 0) {
    rightPaddleY += rightPaddleSpeed;
  }
  else {
    rightPaddleY -= rightPaddleSpeed; 
  }
  
  // Border checks
  // Top
  if (ballY < 0) {
    ballVelocityY = 1;
  }
  // Bottom
  if (ballY > height) {
    ballVelocityY = -1;
  }
  // Left
  if (ballX < 0) {
    ballVelocityX = 1;
    score--;
  }
  // Right
  if (ballX > width) {
    ballVelocityX = -1;
    score++;
  }
  
  boolean leftPaddleCollision = ballX >= leftPaddleX && ballX <= leftPaddleX + paddleWidth && ballY >= leftPaddleY && ballY <= leftPaddleY + paddleHeight;
  if (leftPaddleCollision) {
    ballVelocityX = 1;
  }
  boolean rightPaddleCollision = ballX >= rightPaddleX && ballX <= rightPaddleX + paddleWidth && ballY >= rightPaddleY && ballY <= rightPaddleY + paddleHeight;
  if (rightPaddleCollision) {
    ballVelocityX = -1;
  }
  
  ballX += ballVelocityX * ballSpeed;
  ballY += ballVelocityY * ballSpeed;
  
  clear();
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);
  circle(ballX, ballY, ballSize);
  text("Score: " + score, 10, 10);
}
