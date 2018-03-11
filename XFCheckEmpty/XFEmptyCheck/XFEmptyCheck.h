//
//  XFEmptyCheck.h
//  CustomAll
//
//  Created by 李晓飞 on 2018/3/9.
//  Copyright © 2018年 xiaofei. All rights reserved.
//
/**
 * 判空处理
 */
#import <Foundation/Foundation.h>

@interface XFEmptyCheckModel : NSObject

@property (nonatomic, strong)NSString *content;         // 作为判断的内容
@property (nonatomic, strong)NSString *warning;         // 为空时的提示

@end

typedef void(^MethodBlock)(void);
typedef void(^WarnBlock)(NSString *warning);

@interface XFEmptyCheck : NSObject
/**
 * param contentArr 需要作为判断的字符串内容数组
 * param warningArr 为空时对应的提示内容数组
 */
- (void)emptyCheckWithContentArr:(NSArray *)contentArr
                      WarningArr:(NSArray *)warningArr
                     MethodBlock:(MethodBlock)methodBlock
                    WarningBlock:(WarnBlock)warnBlock;

- (void)emptyCheckWithDictArr:(NSArray<NSDictionary *> *)dictArr
                  methodBlock:(MethodBlock)methodBlock
                 warningBlock:(WarnBlock)warningBlock;

- (void)emptyCheckWithModelArr:(NSArray<XFEmptyCheckModel *> *)modelArr
                   methodBlock:(MethodBlock)methodBlock
                   waringBlock:(WarnBlock)warningBlock;

- (void)checkEmptyWithDataArr:(NSArray *)dataArr
                  methodBlock:(MethodBlock)methodBlock
                 warningBlock:(WarnBlock)warningBlock;

@end
