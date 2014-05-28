//  IMPLEMENTATION
//  CounterBrain.m
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "CounterBrain.h"

@interface CounterBrain()




@end

@implementation CounterBrain
-(void)updateStitchcounterTotalRowswithRowsCompleted{
    
}

-(void)resetCounter {
    
}



/*errors if rowsCompleted = 0 and stepper = -, rowsCompleted=totalRows and stepper = +*/



/* errors if totalRows < rowsCompleted; totalRows < 0, totalRows >1000*/

-(double)calculateRowsToDo {
    _rowsToDo = _totalRows - _rowsCompleted;
    return _rowsToDo;
}
@end
