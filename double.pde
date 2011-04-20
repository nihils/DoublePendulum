float ra;
float rb;
float ma;
float mb;
float alpha;
float beta;
float alpha_dot;
float beta_dot;
float alpha_ddot;
float beta_ddot;

float g;

void setup() {
    size(screen.width, screen.height);
    frameRate(20);
    smooth();

    ra = 100.0f;
    rb = 100.0f;
    ma = 1.0f;
    mb = 0.1f;
    alpha = (1.5 * PI); 
    beta = (1.5 * PI); 
    alpha_dot = 0.0f;
    beta_dot = 0.0f;
    alpha_ddot = 0.0f;
    beta_ddot = 0.1f;

    g = 0.5f;
}

void draw() {
    background(0);
    translate(width / 2, 200);
    
    float xa = -ra * sin(alpha);
    float ya = ra * cos(alpha);
    float xb = -ra * sin(alpha) - rb * sin(beta);
    float yb = ra * cos(alpha) + rb * cos(beta);

    stroke(126);
    fill(200);
    line(0, 0, xa, ya);	
    stroke(126);
    fill(200);
    line(xa, ya, xb, yb);	

    ellipseMode(CENTER);
    noStroke();
    fill(240);
    ellipse(0, 0, 8, 8);

    ellipseMode(CENTER);
    noStroke();
    fill(200);
    ellipse(xa, ya, 32, 32);

    ellipseMode(CENTER);
    noStroke();
    fill(200);
    ellipse(xb, yb, 16, 16);
   
    alpha_ddot = ((-mb * rb * beta_ddot * cos(alpha - beta)) - (mb * rb * beta_dot * beta_dot * sin(alpha - beta)) - (g * (ma + mb) * sin(alpha))) / ((ma + mb) * ra);
    beta_ddot = ((-ra * alpha_ddot * cos(alpha - beta)) + (ra * alpha_dot * alpha_dot * sin(alpha - beta)) - (g * sin(beta))) / (rb);
    //alpha_ddot += 0.001f;
    //beta_ddot += 0.001f;
    alpha_dot += alpha_ddot;
    beta_dot += beta_ddot;
    alpha += alpha_dot;
    beta += beta_dot;
}
void mousePressed() {
    alpha = (1.5 * PI) + random(0,0.09); 
    beta = (1.5 * PI) + random(0,0.09); 
    alpha_dot = 0.0f;
    beta_dot = 0.0f;
    alpha_ddot = 0.0f;
    beta_ddot = 0.1f;
}
