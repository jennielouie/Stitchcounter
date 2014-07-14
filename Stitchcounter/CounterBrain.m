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
    _totalRows = 0;
}


-(CounterBrain *)initWithTotalRows:(NSString *)totalRows {
    self = [super init];
    _totalRows = [totalRows doubleValue];
    _rowsCompleted = 0;
    [self calculateRowsToDo];
    return self;
}

-(double)calculateRowsToDo {
    _rowsToDo = _totalRows - _rowsCompleted;
    return _rowsToDo;
}

-(void)updateWithNewTotal:(double)newTotal {
//    if (_rowsCompleted > newTotal){
//        _rowsCompleted = 0;
//    }
    _totalRows = newTotal;
    [self calculateRowsToDo];
}

-(void)updateWithNewRowsCompleted:(double)newValue {
    if(newValue >= _totalRows) {
        _rowsCompleted = _totalRows;
    } else {
    _rowsCompleted = newValue;
    }
    [self calculateRowsToDo];
}

-(void)changeRowsCompletedWithDelta:(double)delta
{
    double changedValue = _rowsCompleted + delta;
    //if(changedValue >= 0 & changedValue <= _totalRows)
    //{
        _rowsCompleted = changedValue;
        [self calculateRowsToDo];
    //}
}

-(void)updateWithEditedRowsCompleted:(double)editedRowsCompleted {
    if (editedRowsCompleted < _totalRows){
        _rowsCompleted = editedRowsCompleted;
        [self calculateRowsToDo];
    }
}
@end
