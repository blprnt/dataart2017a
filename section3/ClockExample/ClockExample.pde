import java.util.Date;

Date startDate;
Date endDate;
Date currentDate;
float timeMag = 1000;

void setup() {
  size(1280,720);
  initClock();
}

void draw() {
  background(0);
  updateClock();
  text(currentDate.toString(), 50, 50);
  
}

void initClock() {
  startDate = new Date(116, 0, 1);
  endDate = new Date(117, 0, 1);
  currentDate = startDate;
}

void updateClock() {
  float timeElapsed = (1.0 / frameRate) * 1000;
  println(timeElapsed);
  currentDate = new Date(currentDate.getTime() + (long) (timeElapsed * timeMag));
}