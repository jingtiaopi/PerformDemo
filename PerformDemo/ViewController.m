//
//  ViewController.m
//  PerformDemo
//
//  Created by TP on 2018/3/29.
//  Copyright © 2018年 TP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id obj = [self performSelector:@selector(testPerformMethod)];
    NSLog(@"testPerformMethod: %@", obj);
    
    //解决performSelector 执行的方法 返回值不是NSObject类型
    SEL sel0 = @selector(testNotObjectMethod);
    NSMethodSignature *ms = [self methodSignatureForSelector:sel0];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:ms];
    invocation.target = self;
    invocation.selector = sel0;
    // sel0参数
    // 赋值方式
    // NSString *param1 = @"";
    // [invocation setArgument:&param1 atIndex:2];
    [invocation invoke];
    int rtnVal = 0;
    [invocation getReturnValue:&rtnVal];
    NSLog(@"return value:%d", rtnVal);
    
    //结构体
    SEL sel2 = @selector(testStructMethod);
    NSMethodSignature *ms2 = [self methodSignatureForSelector:sel2];
    NSInvocation *invocation2 = [NSInvocation invocationWithMethodSignature:ms2];
    invocation2.target = self;
    invocation2.selector = sel2;
    // sel0参数
    // 赋值方式
    // NSString *param1 = @"";
    // [invocation setArgument:&param1 atIndex:2];
    [invocation2 invoke];
    CGRect rect;
    [invocation2 getReturnValue:&rect];
    NSLog(@"return rect:%@", NSStringFromCGRect(rect));
}


- (NSNumber *)testPerformMethod
{
    return @(250);
    //    return @"！！！ log test performSelector method.";
}

- (BOOL)testNotObjectMethod
{
    return YES;
}

- (CGRect)testStructMethod
{
    return CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
}


@end
