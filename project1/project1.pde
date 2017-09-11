Table dataset;

int rowCount;


/* Input variables */
int []labelInput;
String []labelString;

float [] widthInput;
float [] heightInput;

/* Training variables */
int [] widthTraining;
int [] heightTraining;


/* Test variables */
int [] widthTest;
int [] heightTest;


/* Prediction variables */
int [] predictedTestType;


void predictTestType() {
   // Iterating over all the training values
   
   // For each trainding value (x,y> (width,height)  find the euclidean distance between  the current test (x,y)
   // and the training value (x,y)
   
   // the predicted test type is the training data that has the lowest Euclidean distance
   // set the predicted thpe for that training set to be the same type for that training data
  
  
  
  
}

int calculateAccuracy() {
  
   // Gather all the test data whose type is the correct type  and devide that number over the total number of 
   // test data 
   
   // return the reusult
  
}


void readInput() {
 
   rowCount = dataset.getRowCount();
   labelInput = new int[rowCount];
   labelString = new String[rowCount];
   widthInput = new float[rowCount];
    heightInput = new float[rowCount]; 
   
   for (int row = 1; row < rowCount; row++) {
     
     labelInput[row] = dataset.getInt(row,0);
     labelString[row] = dataset.getString(row,1);
     
     widthInput[row] = dataset.getFloat(row, 4);
     heightInput[row] = dataset.getFloat(row,5);
     
   }
   
   for ( int row =0; row < rowCount; row++ ) {
      print( "(" + widthInput[row] + "," + heightInput[row] + " ) " );
      
     
   }
  
}

void setup() {
  
  size(700,700);
  dataset = new Table("fruit_data_with_colors.txt");  
  readInput();
  
  
  /* Show all the test points as circles */
  

  
  
}

void drawTrainingData() {
  color[] colorValues = new color[5];
  // Assign 5 different colors
  
  colorValues[0] = #000000;  // Black
  colorValues[1] = #FF0000;  // Red
  colorValues[2] = #FFFF00;  // Yellow
  colorValues[3] = #0000FF; // Blue
  colorValues[4] = #00FF00; // Lime
  
  int modulusCount = 0;
  
  
  for (int row = 0; row < rowCount; row++){
    
    
    
    int category = modulusCount++ % 4;
    
    if (category == 0) {
       // This is our test data 
       // Used the sqaure function to show test data.
      
    } else {
        // This row represents our training data 
        
        // Color the trainining data
        
        if ( labelInput[row] == 1 ) {
             // Black for apple      
             fill(colorValues[0]);
        } else if (labelInput[row] == 2) {
             // Mandarin 
             fill(colorValues[1]);
        } else if (labelInput[row] == 3) {
            // Orange
            fill(colorValues[2]); 
        } else if (labelInput[row] == 4) {
            // Lemon
            fill(colorValues[3]); 
        }
        ellipse(widthInput[row] * 50, heightInput[row] * 50, 5,5);
    }
    
   
    
    
  } 
  
  
  // loop, while using the fill command , then ellipse to draw data
  
}


void draw() {
  
 // This is where the visualization is.
   drawTrainingData();
  
}