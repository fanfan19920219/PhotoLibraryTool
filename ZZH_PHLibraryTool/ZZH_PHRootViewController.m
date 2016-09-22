//
//  ZZH_PHRootViewController.m
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_PHRootViewController.h"
#import "ZZH_PH_Header.h"


@interface ZZH_PHRootViewController (){
    ZZH_PHShowListController *showListVC;
}
@property (nonatomic , assign)void(^returnBlock)(NSMutableArray*array);
@end

@implementation ZZH_PHRootViewController

ZZH_PHRootViewController *selfVC;

+(instancetype)ShareZZH_PHlibraryTool{
    if (selfVC==nil) {
        selfVC =[[ZZH_PHRootViewController alloc]init];
    }
    return selfVC;
}
-(void)getSelectPhotoWithReturnBlock:(void(^)(NSMutableArray* returnArray))returnBlock{
    
    returnBlock = showListVC.returnBlock;
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self controllerInitMethod];
}


-(void)controllerInitMethod{
    //  NavgatioViewController
    showListVC = [[ZZH_PHShowListController alloc]init];
    showListVC.cachePhotoArray = [[NSMutableArray alloc]init];
    
    UINavigationController *nav       = [[UINavigationController alloc]initWithRootViewController:showListVC];
    nav.view.frame                        = self.view.frame;
    nav.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
    
    
}



@end