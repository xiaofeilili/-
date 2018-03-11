//
//  ViewController.m
//  XFCheckEmpty
//
//  Created by 李晓飞 on 2018/3/11.
//  Copyright © 2018年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "XFEmptyCheck.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)NSString *str1;
@property (nonatomic, strong)NSString *str2;
@property (nonatomic, strong)NSString *str3;
@property (nonatomic, strong)NSString *str4;
@property (nonatomic, strong)NSString *str5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (NSInteger i=0; i<5; i++) {
        UITextField *textField = [[UITextField alloc] init];
        textField.frame = CGRectMake(50, 100 + 50 * i, 100, 40);
        textField.tag = 100 + i;
        textField.delegate = self;
        textField.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:textField];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 150, 50, 50);
    btn.backgroundColor = [UIColor brownColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    NSArray *cArr = @[self.str1 ? self.str1 : @"",
                      self.str2 ? self.str2 : @"",
                      self.str3 ? self.str3 : @"",
                      self.str4 ? self.str4 : @"",
                      self.str5 ? self.str5 : @""];
    
    NSArray *wArr = @[@"请输入1",
                      @"请输入2",
                      @"请输入3",
                      @"请输入4",
                      @"请输入5"];
    XFEmptyCheck *emptyCheck = [[XFEmptyCheck alloc] init];
    [emptyCheck emptyCheckWithContentArr:cArr WarningArr:wArr MethodBlock:^{
        NSLog(@"都输入了！");
    } WarningBlock:^(NSString *warning) {
        NSLog(@"%@", warning);
    }];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag - 100) {
        case 0:
            self.str1 = textField.text;
            break;
        case 1:
            self.str2 = textField.text;
            break;
        case 2:
            self.str3 = textField.text;
            break;
        case 3:
            self.str4 = textField.text;
            break;
        case 4:
            self.str5 = textField.text;
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
