float r;
float g;
float theta;
float omega;

void setup() {
    size(screen.width, screen.height);
    frameRate(30);
    smooth();

    g = 0.5f;

    r = 50.0f;
    theta = (1.5 * PI);
    omega = 0.0f; 
}

void draw() {
    background(0);
    translate(width / 2, 200);

    float x = -r * sin(theta);
    float y = -r * cos(theta);
    
    stroke(126);
    fill(200);
    line(0, 0, x, y);	

    ellipseMode(CENTER);
    noStroke();
    fill(200);
    ellipse(x, y, 16, 16);

    omega += (g / r) * sin(theta);
    theta += omega
}
