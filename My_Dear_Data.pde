String[] games = {"Valorant", "CS2", "Fortnite"};

float[][] hours = {
  {1.5, 0, 2},   // Monday (Valorant, CS2, Fortnite)
  {0, 1.5, 0.5}, // Tuesday (Valorant, CS2, Fortnite)
  {2, 1, 0},     // Wednesday (Valorant, CS2, Fortnite)
  {0.5, 0, 1.5}, // Thursday (Valorant, CS2, Fortnite)
  {3, 0, 1},     // Friday (Valorant, CS2, Fortnite)
  {0, 2, 3},     // Saturday (Valorant, CS2, Fortnite)
  {1, 0, 1.5}    // Sunday (Valorant, CS2, Fortnite)
};

// Visualization settings
float centerX, centerY;
float radius = 150;
color[] colors;

void setup() {
  size(850, 700);
  centerX = width / 2;
  centerY = height / 2;
  colors = new color[] {
    color(255, 87, 51), // Valorant
    color(51, 153, 255), // CS2
    color(123, 237, 159)  // Fortnite
  };
}

void draw() {
  background(30);
  textAlign(CENTER, CENTER);
  textSize(14);

  // Heading at the top
  fill(255);
  textSize(20);
  text("Video Game Logger", width / 2, 40);

  // Draw visualization for each day
  String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
  
  for (int day = 0; day < 7; day++) {
    float y = 100 + day * 80; // Vertical position for each day (increased space)
    float x = 100;
    float totalHours = 0;

   
    for (int game = 0; game < games.length; game++) {
      totalHours += hours[day][game];
    }

    for (int game = 0; game < games.length; game++) {
     
      if (hours[day][game] == 0) {
        continue;
      }

      float barWidth = map(hours[day][game], 0, totalHours, 0, 460); // Increased width range for better spacing
      fill(colors[game]);
      rect(x, y, barWidth, 40); 

      // Draw the number of hours on the bar with more space from the bar
      fill(255);
      text(hours[day][game] + " hrs", x + barWidth / 2, y + 20); // Adjusted text position

      x += barWidth + 10; // Increased space between bars
    }

    fill(255);
    text(days[day], 50, y + 20);
  }

  // Legend moved to the right
  float legendX = 600;  // Increased value to move the legend to the right
  float legendY = 100;
  float legendSpacing = 50;  // Space between legend items

  for (int i = 0; i < games.length; i++) {
    fill(colors[i]);
    rect(legendX + i * (legendSpacing + 30), legendY, 20, 20); // Place squares side by side
    fill(255);
    text(games[i], legendX + i * (legendSpacing + 30) + 30, legendY + 10);  // Adjusted text position to fit side by side
  }
}
