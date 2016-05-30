//
//  ViewController.m
//  模仿神奇2
//
//  Created by 常琼 on 16/5/24.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1";
    self.iv =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.iv.frame = CGRectMake(200, 350, 100, 100);
    [self.view addSubview:self.iv];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2 *v2 = [ViewController2 new];
    self.navigationController.delegate = v2;



    [self.navigationController pushViewController:v2 animated:YES];


}



@end
