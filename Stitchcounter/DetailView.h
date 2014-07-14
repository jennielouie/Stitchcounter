//
//  DetailView.h
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/10/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailView;

@protocol DetailViewDelegate <NSObject>
- (void)detailView:(DetailView *)detailView totalTextFieldEditedWithText:(NSString *)total;
- (void)detailView:(DetailView *)detailView completedTextFieldEditedWithText:(NSString *)completed;
@end

@interface DetailView : UIView <UITextFieldDelegate>
-(void)addDetailSubviews;
-(void)addDetailRules;
-(void)updateDetailViewTotal:(double)total AndCompleted:(double)completed;

@property (nonatomic, assign) id<DetailViewDelegate>delegate;

@end
