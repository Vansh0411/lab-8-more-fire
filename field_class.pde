class Field {

 Land[][] grid;
 int numTracts;
 int numPlots;

 Field(int numRows, int numCols, float density) {
 numTracts = numRows;
 numPlots = numCols;
 grid = new Land[numTracts][numPlots];
 setupLand(density);
 }//constructor


 void setupLand(float density) {
 //figure out size of each plot of land
 int plotSize = width / numPlots;

 //instantiate each Land object
 for (int r=0; r<grid.length; r++) {
 for (int p=0; p < grid[r].length; p++) {
 int type = DIRT;

 //first Land object should be FIRE
 if (p == 0) {
 type = FIRE;
 }//start with fire

 //Chance for grass is based on density
 else if (random(100) < density) {
 type = GRASS;
 }//grass land

 //creates a new land at (x, y) with size plotSize and type
 grid[r][p] = new Land(p*plotSize, r*plotSize, plotSize, type);
 }//col loop
 }//row loop
 }//setupLand

 void showLand() {
 for (int r=0; r < grid.length; r++) {
 for (int p=0; p < grid[r].length; p++) {
 grid[r][p].display();
 }//col
 }//row
 }//showLand

 void wildFire() {
 //First, check Land objects to the left, apply state change rules.
 for (int r=0; r < grid.length; r++) {
 //Assume nothing useful to the left of row[0]
 for (int p=1; p < grid[r].length; p++) {
 boolean neighborOnFire = false;
 if(r > 0 && grid[r-1][p].state == FIRE){
 neighborOnFire = true;
 }
 if(r < grid.length-1 && grid[r+1][p].state == FIRE){
 neighborOnFire = true;
 }
 if(p > 0 && grid[r][p-1].state == FIRE){
 neighborOnFire = true;
 }
 if(p < grid[r].length-1 && grid[r][p+1].state == FIRE){
 neighborOnFire = true;
 }
 
 grid[r][p].updateNextState(neighborOnFire); 
 }//set nextStates for all plots
 }//row

 //Based on potential state changes from updateNextState
 for (int r=0; r < grid.length; r++) {
 for (int p=0; p < grid[r].length; p++) {
 grid[r][p].changeState();
 }//col
 }//change states
 }//liveFire
 }//class Field
