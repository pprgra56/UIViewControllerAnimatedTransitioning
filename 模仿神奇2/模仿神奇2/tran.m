//
//  tran.m
//  模仿神奇2
//
//  Created by 常琼 on 16/5/24.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "tran.h"
#import "ViewController2.h"
#import "ViewController.h"


@interface tran()
@property(assign,nonatomic) pushtype type;

@end


@implementation tran
+(instancetype)tranWithtype:(pushtype)type{
    return  [[self alloc] initWithtype:type];
}
-(instancetype)initWithtype:(pushtype)type{
    self = [super init];
    if(self){
        _type = type;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return .75f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (_type == push){
        [self pushMathordWith:transitionContext];
    }else{
        [self popMathorWith:transitionContext];
    }

}
- (void)popMathorWith:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1
    ViewController2 *fromvc  = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];



    //2
    UIView *containerView = [transitionContext containerView];



    //3
    UIView *tempView = [fromvc.iv2 snapshotViewAfterScreenUpdates:NO];

    tempView.frame = fromvc.iv2.frame;
    fromvc.iv2.hidden = YES;
    tovc.iv.hidden = YES;
    tovc.view .alpha  = 0;




    [containerView addSubview:tempView];
    [containerView addSubview:tovc.view];
    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.frame =  tovc.iv.frame;



    }completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if([transitionContext transitionWasCancelled]){
            fromvc.iv2.hidden = NO;
            [tempView removeFromSuperview];

        }else{
            tovc.iv.hidden = NO;
            tovc.view.alpha = 1;//
            [tempView removeFromSuperview];
        }



    }];



}
- (void)pushMathordWith:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1 fromvc tovc
    ViewController *fromvc  =[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController2 *tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    //2 containView
    UIView *containview = [transitionContext containerView];


    //3 addsubView
    UIView *tempview = [fromvc.iv snapshotViewAfterScreenUpdates:NO];
    tempview.frame = fromvc.iv.frame;
    fromvc.iv.hidden = YES;

    tovc.iv2.hidden = YES;




    [containview addSubview:tovc.view];
    [containview addSubview:tempview];
    tovc.view.alpha = 0;

    //4 animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        tempview.frame = tovc.iv2 .frame;

    }completion:^(BOOL finished) {

        [transitionContext completeTransition:YES];
        tovc.view.alpha = 1;
        fromvc.iv.hidden = NO;
        tovc.iv2.hidden = NO;
        [tempview removeFromSuperview];
    }];


}
@end
