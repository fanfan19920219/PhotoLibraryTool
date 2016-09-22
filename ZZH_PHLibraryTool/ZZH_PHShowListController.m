//
//  ZZH_PHShowListController.m
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_PHShowListController.h"
#import "ListTableViewDelegate.h"
#import "ListTableViewDataSource.h"
#define TITLE @"相册列表"

@interface ZZH_PHShowListController ()<ListTableViewPushDelegate,setCachesArrayDelegate>
{
    UITableView *_tableView;
    ListTableViewDelegate *tableViewDelegate;
    ListTableViewDataSource *tableViewDataSource;
}
@end

@implementation ZZH_PHShowListController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initmethod];
    
}

-(void)initmethod{
    
    self.title = TITLE;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[ZZH_PH_GetAssetObject Default]getAlbumListWithReturnBlock:^(NSMutableArray *returnListArray, NSMutableArray *returnAssetsArray) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            tableViewDelegate = [[ListTableViewDelegate alloc]init];
            tableViewDelegate.delegate = self;
            tableViewDataSource = [[ListTableViewDataSource alloc]init];
            tableViewDelegate.DataArray = returnAssetsArray;
            tableViewDataSource.DataArray = returnListArray;
            _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
            _tableView.dataSource = tableViewDataSource;
            _tableView.delegate = tableViewDelegate;
            _tableView.tableFooterView = [[UIView alloc]init];
            [self.view addSubview:_tableView];
        });
    }];
    
    
    
//    UIButton *dismissbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//    dismissbutton.frame = CGRectMake(15, 10, 60, 20);
//    [dismissbutton setTitle:@"关闭" forState:UIControlStateNormal];
//    [dismissbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [dismissbutton addTarget:self action:@selector(dismisss) forControlEvents:UIControlEventTouchUpInside];
//    [self.navigationController.navigationBar addSubview:dismissbutton];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 2, 50, 30);
    button.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.3];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:RGB(64) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismisss) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
}

-(void)dismisss{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(void)ReturnBlock{
    self.returnBlock(self.cachePhotoArray);
}

-(void)tableViewPush:(UIViewController *)nextViewContoller withParameter:(id)indexParameter{

    ZZH_PHPhotoViewController *showphotoVC = (ZZH_PHPhotoViewController*)nextViewContoller;
    showphotoVC.cachePhotoArray = self.cachePhotoArray;
    showphotoVC.title = (NSString*)indexParameter;
    [self.navigationController pushViewController:showphotoVC animated:YES];
    [showphotoVC setDelegate:self];
    
}

#pragma mark ::::::::::::::::setCachesArrayDelegate:::::::::::::::::::
/**
 *  添加删除已经选中照片的方法
 *
 *  @param judgmentIndex YES为添加   NO为删除
 *  @param object            object = PHCellImageView
 */
-(void)addOrDelete:(BOOL)judgmentIndex withObject:(id)object{
    
    ZZH_PHCellImageView *imageView = (ZZH_PHCellImageView*)object;
    
    if(judgmentIndex==NO) {
        
        [self.cachePhotoArray addObject:imageView];
        
    } else {
        
        for(ZZH_PHCellImageView *judgmentImegView in self.cachePhotoArray){
            
            if([judgmentImegView.asset.localIdentifier isEqualToString:imageView.asset.localIdentifier]){
                [self.cachePhotoArray removeObject:judgmentImegView];
                break;
            }
        }
    }
}


@end
