//
//  PerformSelectorViewController.m
//  RunLoop
//
//  Created by Charles on 2019/9/4.
//  Copyright © 2019 Charles. All rights reserved.
//

#import "PerformSelectorViewController.h"

@interface PerformSelectorViewController ()

@end

@implementation PerformSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self performSelector:@selector(onMainThread) withObject:nil afterDelay:3];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSThread currentThread] setName:@"gaga"];
        [self performSelector:@selector(onOtherThread) withObject:nil afterDelay:3];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop run];
    });

}

- (void)onMainThread {
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)onOtherThread {
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    NSLog(@"%@", runLoop);
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


@end
