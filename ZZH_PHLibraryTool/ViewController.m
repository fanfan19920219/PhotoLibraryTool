//
//  ViewController.m
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
#import "ZZH_PHRootViewController.h"
#import "ZZH_PH_Header.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<ZZH_ReturnDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *getToolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    getToolButton.frame = CGRectMake(0, 0, 100, 20);
    getToolButton.center = CGPointMake(SCREEN_WIDTH/2, 150);
    [getToolButton addTarget:self action:@selector(getTool) forControlEvents:UIControlEventTouchUpInside];
    [getToolButton setTitle:@"获取相册权限" forState:UIControlStateNormal];
    [getToolButton setTitleColor:RGBA(35, 131, 221, 1) forState:UIControlStateNormal];
    [self.view addSubview:getToolButton];
    
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeCustom];
    openButton.frame = CGRectMake(0, 0, 100, 20);
    openButton.center = CGPointMake(SCREEN_WIDTH/2, 220);
    [openButton addTarget:self action:@selector(openAlbum) forControlEvents:UIControlEventTouchUpInside];
    [openButton setTitle:@"打开相册" forState:UIControlStateNormal];
    [openButton setTitleColor:RGBA(35, 131, 221, 1) forState:UIControlStateNormal];
    [self.view addSubview:openButton];
    
}

-(void)getTool{
    ZZH_PHRootViewController *vc = [[ZZH_PHRootViewController alloc]init];
    [self judementTool];
}

-(void)openAlbum{
    //[self judementTool];
    ZZH_PHRootViewController *vc = [ZZH_PHRootViewController ShareZZH_PHlibraryTool];
    vc.delegate = self;
    vc.maxIndex = 9;
    
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)ZZH_PHoto_ReturnArray:(NSMutableArray *)returnArray{
    NSLog(@"已经选中的照片.... %@",returnArray);
}

-(void)judementTool{
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    switch (status)
    {
        case ALAuthorizationStatusNotDetermined:
        {
            break;
        }
        case ALAuthorizationStatusRestricted:
        case ALAuthorizationStatusDenied:
        {
            UIAlertView *alkerView= [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有获取相册权限" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alkerView show];
            return;
        }
        case ALAuthorizationStatusAuthorized:
        default:
        {
            UIAlertView *alkerView= [[UIAlertView alloc]initWithTitle:@"提示" message:@"已经获取权限" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alkerView show];
            break;
        }
    }
}


-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
