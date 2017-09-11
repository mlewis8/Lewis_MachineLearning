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


void draw() {
  
 // This is where the visualization is. 
   for (int row = 0; row < rowCount; row++){
   
    ellipse(widthInput[row] * 50, heightInput[row] * 50, 5,5);
    
  } 
}