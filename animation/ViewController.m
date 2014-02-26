//
//  ViewController.m
//  animation
//
//  Created by nao on 2014/02/16.
//  Copyright (c) 2014年 showandtell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /*
     背景色を徐々に変更する
     */
    
    // アニメーションさせるビューを追加
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 158)];
    subView.backgroundColor = [UIColor redColor]; // 初期表示は赤色
    [self.view addSubview:subView];
    
    // タップで停止＆再生
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    

    // 2秒間キーフレームアニメーションを実行する（逆再生＆リピート）
    [UIView animateKeyframesWithDuration:2.0
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat
                              animations:^{
                                  // 0.8秒間（2.0 * 0.4）かけて背景を黄色に
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.4
                                                                animations:^{
                                                                    subView.backgroundColor = [UIColor yellowColor];
                                                                }];
                                  
                                  // 0.8秒間（2.0 * 0.4）後に1.2秒間（2.0 * 0.6）かけて背景を緑色に
                                  [UIView addKeyframeWithRelativeStartTime:0.4
                                                          relativeDuration:0.6
                                                                animations:^{
                                                                    subView.backgroundColor = [UIColor greenColor];
                                                                }];
                              } completion:NULL];

}

- (void)tapped
{
    NSLog(@"タップ");
}

@end
