//
//  TimerTwoViewController.m
//  RunLoop
//
//  Created by Charles on 2019/9/4.
//  Copyright © 2019 Charles. All rights reserved.
//

#import "TimerTwoViewController.h"

@interface TimerTwoViewController ()

@end

@implementation TimerTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
        [runloop run];
    });
}

- (void)beginUpdateUI {
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

@end
