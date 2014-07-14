//  HEADER
//  CounterBrain.h
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterBrain : NSObject
@property double rowsToDo;
@property double rowsCompleted;
@property double totalRows;

//designated initializer
-(CounterBrain *)initWithTotalRows:(NSString *)totalRows;

-(void)resetCounter;
-(void)updateWithNewTotal:(double)newTotal;
-(void)updateWithNewRowsCompleted:(double)steppervalue;
-(void)updateWithEditedRowsCompleted:(double)editedRowsCompleted;
-(void)changeRowsCompletedWithDelta:(double)delta;


@end
