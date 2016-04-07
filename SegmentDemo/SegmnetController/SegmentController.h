//
//  SegmentController.h
//  SegmentDemo
//
//  Created by 曾经 on 16/4/7.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentController;
typedef NS_OPTIONS(NSUInteger, SegmentControllerStyle) {
    SegmentControllerWithDefault = 0,
    SegmentControllerStyleTitleFirst =1,
    SegmentControllerStyleImageFirst =2,
    SegmentControllerStyleImageUpTitledown = 3,
};

@protocol SegmentControllerDelegate <NSObject>
- (void)didSelectedIndex:(NSInteger)index;
- (void)didSelectedIndex:(SegmentController *)segment withIndex:(NSInteger)index;
@end
@interface SegmentController : UIView
@property(nonatomic,assign)id<SegmentControllerDelegate>delegate;

@property(strong,nonatomic) NSMutableArray *allItmes;
@property(strong,nonatomic) NSMutableArray *itmesObject;
@property(strong,nonatomic) UIColor *defaultColor;
@property(strong,nonatomic) UIColor *selectedColor;
@property(strong,nonatomic) UIFont *titleFond;
@property(assign,nonatomic) SegmentControllerStyle style;
- (void)createItmes:(NSMutableArray *)list;
- (void)selectedByIndex:(NSInteger)index;
- (void)setTingSegmentTitleWithIndex:(NSInteger)index title:(NSString *)title;
@end
