//
//  TimerViewManager.m
//  PourOveriOS
//
//  Created by Admin on 5/19/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "TimerView.h"
#import "TimerViewManager.h"

@implementation TimerViewManager

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(timerColor, UIColor)

- (UIView *)view
{
    TimerView *view = [[TimerView alloc] init];
    return view;
}

@end
