//
//  tran.h
//  模仿神奇2
//
//  Created by 常琼 on 16/5/24.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef   enum {
    push = 0,
    pop
}pushtype;

@interface tran : NSObject<UIViewControllerAnimatedTransitioning>

+(instancetype)tranWithtype:(pushtype)type;
@end
