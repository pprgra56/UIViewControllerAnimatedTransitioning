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
@property (nonatomic, strong) XWInteractiveTransition *interactiveTransition;

@end


@implementation ViewController2
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.iv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.iv2 .frame =  CGRectMake(self.view.frame.size.width/2-144,44, 288, 288);
    [self.view addSubview: self.iv2];

    self.interactiveTransition = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePop GestureDirection:XWInteractiveTransitionGestureDirectionRight];
 [_interactiveTransition addPanGestureForViewController:self];
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
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    //手势开始的时候才需要传入手势过渡代理，如果直接点击pop，应该传入空，否者无法通过点击正常pop
    return _interactiveTransition.interation ? _interactiveTransition : nil;
}
@end
