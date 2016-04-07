//
//  NSString+BoundingRect.m
//  SegmentDemo
//
//  Created by 曾经 on 16/4/7.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "NSString+BoundingRect.h"

@implementation NSString (BoundingRect)

- (CGSize)getStringRect:(UIFont *)font

{
    if (self==nil||self.length==0) {
        return CGSizeZero;
    }
    CGSize size;
    NSMutableAttributedString* atrString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = NSMakeRange(0, atrString.length);
    [atrString addAttribute:NSFontAttributeName
                      value:font
                      range:range];
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    
    size = [self boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 30)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:dic
                              context:nil].size;
    
    return  size;
    
}
- (float)stringWith:(UIFont *)font{
    
    return [self getStringRect:font].width;
}

- (CGSize)getStringRect:(UIFont *)font withSize:(CGSize)sizes

{
    if (self==nil) {
        return CGSizeZero;
    }
    CGSize size;
    NSMutableAttributedString* atrString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = NSMakeRange(0, atrString.length);
    [atrString addAttribute:NSFontAttributeName
                      value:font
                      range:range];
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    
    size = [self boundingRectWithSize:sizes
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:dic
                              context:nil].size;
    
    return  size;
    
}

- (NSDate *)dateFromString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy:MM:dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:self];
    return destDate;
    
}@end
