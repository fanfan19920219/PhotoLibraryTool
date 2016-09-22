//
//  ZZH_PHRootViewController.h
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZH_PH_Header.h"

@interface ZZH_PHRootViewController : UIViewController

+(instancetype)ShareZZH_PHlibraryTool;


-(void)getSelectPhotoWithReturnBlock:(void(^)(NSMutableArray* returnArray))returnBlock;


@end
