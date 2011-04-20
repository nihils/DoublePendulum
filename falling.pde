float g;
float v;
float y;

void setup() {
    size(200, 500);
    frameRate(30);
    smooth();

    g = 0.5f;
    v = 0.0f;
    y = 0.0f;
}

void draw() {
    background(0);
    
    translate(width / 2, height / 2);

    ellipseMode(CENTER);
    noStroke();
    fill(200);
    ellipse(0, y - 200, 16, 16);

    v += g; 
    y += v;
}
