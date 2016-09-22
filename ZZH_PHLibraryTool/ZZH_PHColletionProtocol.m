//
//  ZZH_PHColletionProtocol.m
//  ZZH_PHLibraryTool
//
//  Created by M-SJ077 on 16/9/19.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_PHColletionProtocol.h"

@implementation ZZH_PHColletionProtocol
#pragma mark - collectionView的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.DataArray.count;
}

//collection的代理方法
- (UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    //cell.backgroundColor = [UIColor redColor];
    ZZH_PHCellImageView *imageView = [self.DataArray objectAtIndex:indexPath.item];
    [imageView setSelectButtonFrame];
    imageView.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    [cell.contentView addSubview:imageView];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZH_PHCellImageView *imageView = [self.DataArray objectAtIndex:indexPath.item];
    [[ZZH_PH_GetAssetObject Default]get_Aphoto:imageView.asset original:YES withReturnBlock:^(UIImage *returnImage) {
        @try {
            ZZH_PHShowPhotoController *showPhotoViewController = [[ZZH_PHShowPhotoController alloc]init];
            showPhotoViewController.showImage = returnImage;
            showPhotoViewController.currentIndex = self.cacheArray.count;
            showPhotoViewController.ImageArray = self.cacheArray;
            for(ZZH_PHCellImageView *judgmentView in self.cacheArray){
                if([judgmentView.asset.localIdentifier isEqualToString:imageView.asset.localIdentifier]){
                    showPhotoViewController.currentIndex = [self.cacheArray indexOfObject:judgmentView];
                    break;
                }
            }
            [self.delegate collectionViewPush:showPhotoViewController withParameter:nil];
            
        } @catch (NSException *exception) {
        } @finally {
        }
    }];
}


#pragma mark ::::::::::::::::::::selectButtonDelegatemethod:::::::::::::::::::
-(void)cellSelectButtonClick:(UIButton *)sender andZZH_PHCellImageView:(id)imageView andIndex:(NSInteger)index orClick:(BOOL)orClick{
    
    [self.dataSource addOrDelete:sender.selected withObject:imageView];
    
}


@end
