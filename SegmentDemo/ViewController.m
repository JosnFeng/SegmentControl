//
//  ViewController.m
//  SegmentDemo
//
//  Created by 曾经 on 16/4/7.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "ViewController.h"

#import "SegmentController.h"
@interface ViewController () <SegmentControllerDelegate>
@property(strong,nonatomic) SegmentController *segmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSub];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)layoutSub {
    NSMutableArray *list= @[
                            @{
                                @"title":@" 照片",
                                @"default":@"picIcon-A",
                                @"selected":@"picIcon-B",
                                },
                            @{
                                @"title":@" 密图",
                                @"default":@"scerectIcon-A",
                                @"selected":@"scerectIcon-B",
                                },
                            @{
                                @"title":@" 标签",
                                @"default":@"markIcon-A",
                                @"selected":@"markIcon-B",
                                },@{
                                @"title":@" 用户",
                                @"default":@"scerectIcon-A",
                                @"selected":@"scerectIcon-B",
                                }];
    CGFloat y = 50;
    for (int i = 0; i < 4; i++) {
        self.segmentView = [[SegmentController alloc] initWithFrame:CGRectMake(20, y, 300, 50)];
        _segmentView.backgroundColor = [UIColor lightGrayColor];
        _segmentView.delegate = self;
        [_segmentView selectedByIndex:0];
        _segmentView.style = i;
        [_segmentView createItmes:list];
        [self.view addSubview:self.segmentView];
        y += 100;
    }
}
- (SegmentController *)segmentView {
    if (!_segmentView) {
       
    }
    return _segmentView;
}
- (void)didSelectedIndex:(NSInteger)index {
    NSLog(@"当前选中的为:%ld", index);
}
@end
