//
//  RootViewController.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/23.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTabBar.h"
#import "TTConst.h"
@interface RootViewController ()
@property(nonatomic,strong)NSString *currentSkinMode;//当前皮肤的模式

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建四个视图控制器
    [self createChildViewControllers];
    //更换tabBar
    [self setValue:[CustomTabBar new]forKey:@"tabBar"];
}

- (void)viewWillAppear:(BOOL)animated{

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateSkinMode) name:SkinModelDidChangedNotification object:nil];
    [self updateSkinMode];

}
#pragma mark ---private Method 更换皮肤模式
-(void)updateSkinMode{

    self.currentSkinMode = [[NSUserDefaults standardUserDefaults]stringForKey:CurrentSkinModelKey];
    if ([self.currentSkinMode isEqualToString:DaySkinModelValue]) {
        self.tabBar.barTintColor = [UIColor whiteColor];
        
    }else{
    
        self.tabBar.barTintColor = [UIColor darkGrayColor];
    
    }


}

#pragma mark------私有方法
-(void)createChildViewControllers{
    //通过appearance统一设置所有UITabBarItem的文字属性
    //后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象了来统一设置
    NSMutableDictionary *attrs  = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName]= [UIColor grayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = attrs[NSFontAttributeName] ;
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:(UIControlStateNormal)];
    [item setTitleTextAttributes:selectAttrs forState:(UIControlStateSelected)];
    
    
    //添加子控制器
    [self setUpViewController:[HomeListViewController class] title:@"Home" image:@"Home" selectedImage:@"Home-H"];
    [self setUpViewController:[FriendsListViewController  class] title:@"动态" image:@"Friends" selectedImage:@"Friends-H"];
    [self setUpViewController:[ToolListViewController class] title:@"工具" image:@"Tool" selectedImage:@"Tool-H"];
    [self setUpViewController:[UserViewController class] title:@"我的" image:@"me" selectedImage:@"me-H"];
    

    

}

/**
 *  初始化子控制器
 *
 *  @param class         自定义类
 *  @param title         tabBar title
 *  @param image         未选中状态的图片
 *  @param selectedImage 选中状态下的图片
 */
-(void)setUpViewController:(Class )class title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    UIViewController *vc = [[class alloc]init];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage  = [UIImage imageNamed:selectedImage];
    
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
