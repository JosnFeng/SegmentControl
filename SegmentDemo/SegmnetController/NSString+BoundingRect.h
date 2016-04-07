//
//  NSString+BoundingRect.h
//  SegmentDemo
//
//  Created by 曾经 on 16/4/7.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BoundingRect)


- (CGSize)getStringRect:(UIFont *)font;

- (float)stringWith:(UIFont *)font;
- (CGSize)getStringRect:(UIFont *)font withSize:(CGSize)sizes;
- (NSDate *)dateFromString;

@end
