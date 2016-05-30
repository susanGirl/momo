//
//  RegisterViewController.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/24.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "RegisterViewController.h"
#import <AFNetworking.h>
#import "Url.h"
#import "imageNetWork.h"
#import <UIImageView+WebCache.h>
@interface RegisterViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;//用户名

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;//密码
@property (weak, nonatomic) IBOutlet UITextField *repasswordTextField;//重复输入密码
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;


@property(nonatomic,strong)UIImagePickerController *imagePicker;//图片选择器


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.delegate = self;
    
    
}


//注册按钮
- (IBAction)registerAction:(id)sender {
        __weak RegisterViewController *registerVC = self;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    //    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([alertController.message isEqualToString:@"注册成功"]) {
            [registerVC dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [alertController addAction:cancleAction];
    
    if ([_userNameTextField.text isEqualToString:@""]) {
        alertController.message = @"用户名不能为空";
        [registerVC presentViewController:alertController animated:YES completion:nil];
      }else if ([_passwordTextField.text isEqualToString:@""]){
        
        alertController.message = @"密码不能为空";
        [registerVC presentViewController:alertController animated:YES completion:nil];
        
        
    }else if (![_repasswordTextField.text isEqualToString:_passwordTextField.text]){
        
        alertController.message  = @"两次输入的密码不一致";
        [registerVC presentViewController:alertController animated:YES completion:nil];
        
        
    }
    
    else{
        AVUser *user = [AVUser user];// 新建 AVUser 对象实例
        user.username = self.userNameTextField.text;// 设置用户名
        user.password =  _passwordTextField.text;// 设置密码
        //user.email = @"susan_w_z@163.com";// 设置邮箱
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // 注册成功
                alertController.message = @"注册成功";
                [registerVC presentViewController:alertController animated:YES completion:nil];
            } else {
                // 失败的原因可能有多种，常见的是用户名已经存在。
                
                if ([user[@"success"] intValue ] == 202) {
                    
                    alertController.message = @"用户名已被占用，请重新注册";
                    [registerVC presentViewController:alertController animated:YES completion:nil];
                }
                alertController.message = @"注册失败";
             }
        }];
    }
}

#pragma mark---调用相册的协议方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    __weak RegisterViewController *registerVC = self;
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    //显示头像
    _avatarImageView.image = image;

    if (picker.sourceType== UIImagePickerControllerSourceTypeCamera) {
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(saveImage ), nil);
    }
    //隐藏图片选择页面
    [registerVC dismissViewControllerAnimated:YES completion:nil];

    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //隐藏图片选择页面
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)saveImage{

    NSLog(@"图片存储成功");
    
    
}

/**
 *  点击头像执行方法
 *
 *  @param sender
 */
- (IBAction)tapAvatarViewAction:(id)sender {
    

//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
//    UIAlertAction *photoAction  = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        //指定类型
//        _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//        _imagePicker.allowsEditing = YES;
//        [self presentViewController:_imagePicker animated:YES completion:nil];
//        
//    }];
//    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        _imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
//        _imagePicker.allowsEditing = YES;
//        [self presentViewController:_imagePicker animated:YES completion:nil];
//    }];
//    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
//    [alertController addAction:photoAction];
//    [alertController addAction:cameraAction];
//    [alertController addAction:cancleAction];
//   //显示alertController
//    [self presentViewController:alertController animated:YES completion:nil];
   [self file];
 }

-(void)file{

    AVFile *file = [AVFile fileWithURL:@"http://p4.music.126.net/SwbJDnhHO0DUDWvDXJGAfQ==/6655343883051583.jpg"];
    [file getData];
    //执行上传
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"%@",file.url);
        
    }];
    
    //上传进度监听
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            AVQuery  *query = [AVQuery queryWithClassName:@"_File"];
            [query whereKey:@"priority" equalTo:@0];
            [query whereKey:@"priority" equalTo:@1];
            // 如果这样写，第二个条件将覆盖第一个条件，查询只会返回 priority = 1 的结果
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            }];
        }
        
    } progressBlock:^(NSInteger percentDone) {
        
        
    }];
 
}


#pragma mark----退出按钮
- (IBAction)exitAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
