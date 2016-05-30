//
//  ViewController2.m
//  模仿神奇2
//
//  Created by 常琼 on 16/5/24.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController2.h"
#import "tran.h"
#import "XWInteractiveTransition.h"

@interface ViewController2()

@property(strong,nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;
@property(strong,nonatomic) UIScreenEdgePanGestureRecognizer *pan;





@end


@implementation ViewController2

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.iv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.iv2 .frame =  CGRectMake(self.view.frame.size.width/2-144,44, 288, 288);
    [self.view addSubview: self.iv2];

    self.pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlEdgeScreenPanGesture:)];
    self.pan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.pan];
}

-(void)handlEdgeScreenPanGesture:(UIScreenEdgePanGestureRecognizer *)sender{

/*
 UIGestureRecognizerStatePossible,   // the recognizer has not yet recognized its gesture, but may be evaluating touch events. this is the default state

 ,      // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop
 ,    // the recognizer has received touches recognized as a change to the gesture. the action method will be called at the next turn of the run loop
 UIGestureRecognizerStateEnded,      // the recognizer has received touches recognized as the end of the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
 ,  // the recognizer has received touches resulting in the cancellation of the gesture. the action method will be called at the next turn of the run loop. the recognizer will be reset to UIGestureRecognizerStatePossible

 UIGestureRecognizerStateFailed,     // the recognizer has received a touch sequence that can not be recognized as the gesture. the action method will not be called and the recognizer will be reset to UIGestureRecognizerStatePossible

 // Discrete Gestures – gesture recognizers that recognize a discrete event but do not report changes (for example, a tap) do not transition through the Began and Changed states and can not fail or be cancelled
 UIGestureRecognizerStateRecognize
 */

    CGFloat progress = [sender translationInView:self.view].x/self.view.bounds.size.width;
    NSLog(@"### %f %s(%d) " ,progress, __PRETTY_FUNCTION__, __LINE__);
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
            break;
            case UIGestureRecognizerStateChanged:
            [self.interactiveTransition updateInteractiveTransition:progress];
            break;

            case UIGestureRecognizerStateEnded:
            case UIGestureRecognizerStateCancelled:
        {
            if(progress >=0.5){
                [self.interactiveTransition finishInteractiveTransition];
            }
            else{
                [self.interactiveTransition cancelInteractiveTransition];
            }
        }

            break;
        default:
            break;
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if(operation == UINavigationControllerOperationPush){
      return   [tran tranWithtype:push];
    }else{
        return [tran tranWithtype:pop];
    }

}
//手势
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return self.interactiveTransition;
}
@end
