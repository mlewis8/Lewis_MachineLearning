Table dataset;

int rowCount;


/* Input variables */
int []labelInput;
String []labelString;

float [] widthInput;
float [] heightInput;

Node [] testNodeList;
Node [] trainingNodeList;


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
   return 0;  
}


void readInput() {
 
   rowCount = dataset.getRowCount();
   labelInput = new int[rowCount];
   labelString = new String[rowCount];
   widthInput = new float[rowCount];
    heightInput = new float[rowCount]; 
   int counter = 0;
   int testCount = 0;
   int trainingCount = 0;

   
   
   
   for (int row = 1; row < rowCount; row++) {
      int testType = counter++ % 4;
      if (testType == 0) {
         testCount++; 
      }else {
        trainingCount++; 
      }
   }
   
   testNodeList = new Node[testCount];
   trainingNodeList = new Node[trainingCount];
   
   counter = 0;
   testCount = 0;
   trainingCount = 0;
   for (int row = 1; row < rowCount; row++) {
         
     int testType = counter++ % 4;
     if ( testType == 0 ) {
         Node testNode = new Node();
         testNodeList[testCount++] = testNode;
         testNode.category = dataset.getInt(row,0);
         testNode.labelType = dataset.getString(row,1);
         testNode.xValue = dataset.getFloat(row,4);
         testNode.yValue = dataset.getFloat(row,5);
         testNode.setNodeColor();
     }else {
       Node trainingNode = new Node();
       trainingNodeList[trainingCount++] = trainingNode;
       trainingNode.category = dataset.getInt(row,0);
       trainingNode.labelType = dataset.getString(row,1);
       trainingNode.xValue = dataset.getFloat(row,4);
       trainingNode.yValue = dataset.getFloat(row,5);
       trainingNode.setNodeColor();
     }
   }
   
   for ( int i = 0; i < testNodeList.length; i++ ) {
       testNodeList[i].findSmallestDistance(trainingNodeList);
     
   }
   
   int correctCount = 0;
   for ( int i = 0; i < testNodeList.length; i++ ) {
      if (testNodeList[i].predictionCorrect == true) correctCount++; 
   }
   
   println(" Correct " +  (int) correctCount + " incorrect " + (testNodeList.length - correctCount) );
   print("Accuracy --- " + (double) correctCount /  (double) testNodeList.length );

  
}



void setup() {
  
  size(1000,1000);
  dataset = new Table("fruit_data_with_colors.txt");  
  readInput();

  
  /* Show all the test points as circles */
  

  
  
}

void drawTrainingData() {
  
  
  for (int index = 0; index < testNodeList.length; index++ ) {
     Node testNode = testNodeList[index];
     
     if (testNode.predictionCorrect == false ) {
        fill(#00FF00); 
       // fill(testNode.predictColor);
     }else {
       fill(testNode.predictColor);
     }
     //line((float) testNode.xValue * 60 -5, (float) testNode.yValue *70, (float) testNode.xValue *60 + 5, (float) testNode.yValue * 70);
     ellipse((float) testNode.xValue * 60, (float) testNode.yValue * 70, 5, 5);
    
    
  }
  
  for ( int index = 0; index < trainingNodeList.length; index++ ) {
     Node trainingNode = trainingNodeList[index];
     fill(trainingNode.nodeColor);
     ellipse((float) trainingNode.xValue * 60, (float) trainingNode.yValue * 70, 10, 10);
    
  }
 

  
}


void draw() {
  
 // This is where the visualization is.
   drawTrainingData();
  
}