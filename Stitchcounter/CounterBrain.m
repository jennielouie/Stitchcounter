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

-(void)resetCounter {
    _rowsCompleted = 0;
    _rowsToDo = 0;
    _totalRows = 5;
}


-(CounterBrain *)initWithTotalRows:(NSString *)totalRows {
    self = [super init];
    _totalRows = [totalRows doubleValue];
    _rowsCompleted = 0;
    return self;
}

-(double)calculateRowsToDo {
    _rowsToDo = _totalRows - _rowsCompleted;
    return _rowsToDo;
}

-(void)updateWithNewTotal:(double)newTotal {
    if (_rowsCompleted > newTotal){
        _rowsCompleted = 0;
    }
    _totalRows = newTotal;
    [self calculateRowsToDo];
}

-(void)updateWithNewRowsCompleted:(double)steppervalue {
    if(steppervalue >= _totalRows) {
        _rowsCompleted = _totalRows;
    } else {
    _rowsCompleted = steppervalue;
    }
    [self calculateRowsToDo];
}


-(void)updateWithEditedRowsCompleted:(double)editedRowsCompleted {
    if (editedRowsCompleted < _totalRows){
        _rowsCompleted = editedRowsCompleted;
        [self calculateRowsToDo];
    }
}
@end
