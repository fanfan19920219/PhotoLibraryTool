//
//  ZZH_PHShowListController.h
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZH_PH_Header.h"

@interface ZZH_PHShowListController : UIViewController

@property (nonatomic , strong)NSMutableArray*cachePhotoArray;

@property (nonatomic , assign)id <ZZH_ReturnDelegate>delegate;

@property (nonatomic , assign)void(^returnBlock)(NSMutableArray*array);

-(void)ReturnBlock;
@end
