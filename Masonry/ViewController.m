//
//  ViewController.m
//  Masonry
//
//  Created by Ken on 2017/2/13.
//  Copyright © 2017年 AIA. All rights reserved.
//

// 使用masonry约束必须先把view添加到父控件上

#import "ViewController.h"

// 在#import "Masonry.h"前导入宏，下方的代码所有带有mas的前缀可以省略
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *currentV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];

}

- (void)initLayout
{
    [self edgeLayout];
    [self centerLayout];
    [self updateLayout];
    [self deleteAllLayout];
}

/*****删除以前所有的约束，添加新的约束*****/
- (void)deleteAllLayout
{
    [self.currentV remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        [make center];
    }];
}

- (void)updateLayout
{
    [self.currentV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(100);
    }];
}

- (void)centerLayout
{
//    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@50);
//        make.height.equalTo(@100);
//        [make centerX];
//        [make centerY];
//    }];
    
    // 建议使用 mas_equalTo  会将括号的值不是对象的包装成对象
//    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(50);
//        make.height.mas_equalTo(100);
//        [make centerX];
//        [make centerY];
//    }];
    
    // 最简单写法
    [self.currentV makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 100));
        [make center];
    }];
}

- (void)edgeLayout
{
    //    最基础的写法
    //    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(self.view.mas_left).multipliedBy(1.0).offset(10);
    //        make.right.equalTo(self.view.mas_right).multipliedBy(1.0).offset(-10);
    //
    //        make.top.equalTo(self.view.mas_top).multipliedBy(1.0).offset(10);
    //        make.bottom.equalTo(self.view.mas_bottom).multipliedBy(1.0).offset(-10);
    //
    //    }];
    
    //    当前view跟约束的view是父子关系并且约束位置（上下左右）相同即可这样简写
    //    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.offset(10);
    //        make.right.offset(-10);
    //
    //        make.top.offset(10);
    //        make.bottom.offset(-10);
    //
    //    }];
    
    // offset可以替换为equalTo不过括号中的数字需要换成对象
//        [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@10);
//            make.right.equalTo(@-10);
//    
//            make.top.equalTo(@10);
//            make.bottom.equalTo(@-10);
//    
//        }];
    
    // 将相同约束值的关系合并
    //    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.and.top.offset(10);
    //        make.right.and.bottom.offset(-10);
    //
    //    }];
    
    //and 只是语法作用起到连接关系作用
//        [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.offset(10);
//            make.right.bottom.offset(-10);
//    
//        }];
    
    // 更简单的写法
    //    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    //    UIEdgeInsets edge = UIEdgeInsetsMake(10, 10, 10, 10);
    //    [self.currentV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.insets(edge);
    //        
    //    }];

}



@end
