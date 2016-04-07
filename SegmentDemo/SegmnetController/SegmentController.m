//
//  SegmentController.m
//  SegmentDemo
//
//  Created by 曾经 on 16/4/7.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "SegmentController.h"
#import "NSString+BoundingRect.h"

@implementation SegmentController
@synthesize defaultColor = _defaultColor;
@synthesize selectedColor = _selectedColor;
@synthesize allItmes = _allItmes;
//@synthesize delegate = _delegate;
@synthesize itmesObject = _itmesObject;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _itmesObject = [NSMutableArray new];
        _defaultColor = [UIColor blackColor];
        _selectedColor = [UIColor redColor];
        _titleFond = [UIFont systemFontOfSize:15];
    }
    return self;
}
/*
 @{@"":@"title",
 @"":@"default",
 @"":@"selected",};
 */
//createItmes
- (void)createItmes:(NSMutableArray *)list {
    _allItmes = list;
    [list enumerateObjectsUsingBlock:^(id  itmes, NSUInteger idx, BOOL * _Nonnull stop) {
        [self insertSegmentWithTitle:itmes atIndex:idx];
    }];
    [self selectedByIndex:0];
}
- (void)selectedByIndex:(NSUInteger)index {
    [_itmesObject enumerateObjectsUsingBlock:^(UIButton *btn , NSUInteger idx, BOOL * _Nonnull stop) {
        if (btn.tag == index) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }];
}
- (void)insertSegmentWithTitle:(NSDictionary *)itmeInfo atIndex:(NSUInteger)segment{
    if (!itmeInfo) {
        return;
    }
    UIButton *segmentItems = [[UIButton alloc] init];
    segmentItems.tag = segment;
    if ([itmeInfo valueForKey:@"title"]) {
        [segmentItems setTitle:[itmeInfo valueForKey:@"title"] forState:(UIControlStateNormal)];
    }
    if ([itmeInfo valueForKey:@"default"]) {
        [segmentItems setImage:[UIImage imageNamed:[itmeInfo valueForKey:@"default"]] forState:(UIControlStateNormal)];
    }
    if ([itmeInfo valueForKey:@"selected"]) {
        [segmentItems setImage:[UIImage imageNamed:[itmeInfo valueForKey:@"selected"]] forState:(UIControlStateNormal)];
    }
    [segmentItems addTarget:self action:@selector(handleSelect:) forControlEvents:UIControlEventTouchUpInside];
    [segmentItems setTitleColor:self.defaultColor forState:UIControlStateNormal];
    [segmentItems setTitleColor:self.selectedColor forState:UIControlStateSelected];
    segmentItems.titleLabel.font =self.titleFond;
    NSUInteger sumCount = [self.allItmes count];
    float w = CGRectGetWidth(self.frame) / sumCount;
    if (_style==SegmentControllerWithDefault) {
        
    }else if (_style == SegmentControllerStyleTitleFirst){
        segmentItems.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        segmentItems.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }else if(_style ==SegmentControllerStyleImageFirst){
        segmentItems.imageEdgeInsets = UIEdgeInsetsMake(0, 45, 0, 0);
        segmentItems.titleEdgeInsets = UIEdgeInsetsMake(0, -45, 0, 0);
    }else if (_style ==SegmentControllerStyleImageUpTitledown){
        UIImage *image =[UIImage imageNamed:[itmeInfo valueForKey:@"default"]];
        float titlewidth = [[itmeInfo valueForKey:@"title"] stringWith:self.titleFond];
        segmentItems.imageEdgeInsets = UIEdgeInsetsMake(-8.0,0.0,0.0,-titlewidth);
        segmentItems.titleEdgeInsets = UIEdgeInsetsMake(40.0, -image.size.width,0.0,0.0);
        segmentItems.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    segmentItems.tag=segment;
    segmentItems.frame = CGRectMake(segment*w, (CGRectGetHeight(self.frame)-30)/2, w, 30);
    [self addSubview:segmentItems];
    
    [_itmesObject addObject:segmentItems];
}
- (void)handleSelect:(UIButton *)btn{
    
    [self selectedByIndex:btn.tag];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:btn.tag];
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didSelectedIndex:withIndex:)]) {
        [self.delegate didSelectedIndex:self withIndex:btn.tag];
    }
    
    
}
@end






















