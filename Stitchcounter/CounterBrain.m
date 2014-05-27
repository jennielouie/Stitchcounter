//
//  CounterBrain.m
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "CounterBrain.h"

@implementation CounterBrain
-(double)updateStitchcounterTotalRows:(double)totalRows
                  CompletedSoFar:(double)rowsCompleted
                     withStepper:(NSString *)increment {
    
}

-(double)resetCounter {
    
}

/*Private methods */

-(double)progressRowsDone:(double)rowsCompleted
                  ofTotal:(double)totalRows {
    
}

/*errors if rowsCompleted = 0 and stepper = -, rowsCompleted=totalRows and stepper = +*/

-(double)updateRowsCompleted:(double)rowsCompleted
                 withStepper:(NSString *)increment {
    
}


/* errors if totalRows < rowsCompleted; totalRows < 0, totalRows >1000*/

-(double)calculateRowsToDoFromTotal:(double)totalRows
                  withRowsCompleted:(double)rowsCompleted {
    
}
@end
