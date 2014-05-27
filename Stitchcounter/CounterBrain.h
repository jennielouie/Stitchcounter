//
//  CounterBrain.h
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterBrain : NSObject {
    double totalRows;
    double rowsToDo;
    double rowsCompleted;
    double percentCompleted;
}

-(double)resetCounter;


/*update: get totalRows, rowsCompleted and stepper increment, then call methods to calculate rowsToDo, rowsCompleted and percentCompleted*/
-(double)updateStitchcounterTotalRows:(double)totalRows
                  CompletedSoFar:(double)rowsCompleted
                     withStepper:(NSString *)increment;

@end
