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
@end
