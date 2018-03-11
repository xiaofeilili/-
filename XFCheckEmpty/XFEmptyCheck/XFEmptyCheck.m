//
//  XFEmptyCheck.m
//  CustomAll
//
//  Created by 李晓飞 on 2018/3/9.
//  Copyright © 2018年 xiaofei. All rights reserved.
//

#import "XFEmptyCheck.h"

@implementation XFEmptyCheckModel

@end

@implementation XFEmptyCheck

- (void)emptyCheckWithContentArr:(NSArray *)contentArr
                      WarningArr:(NSArray *)warningArr
                     MethodBlock:(MethodBlock)methodBlock
                    WarningBlock:(WarnBlock)warnBlock {
    if (contentArr.count) {
        if (![contentArr[0] isEqualToString:@""]) {
            NSMutableArray *cMArr = [NSMutableArray arrayWithArray:contentArr];
            [cMArr removeObject:contentArr[0]];
            NSMutableArray *wMArr = [NSMutableArray arrayWithArray:warningArr];
            [wMArr removeObject:warningArr[0]];
            if (cMArr.count) {
                [self emptyCheckWithContentArr:cMArr WarningArr:wMArr MethodBlock:methodBlock WarningBlock:warnBlock];
            }else {
                !methodBlock ? : methodBlock();
            }
            
        }else {
//            NSLog(@"%@", warningArr[0]);
            !warnBlock ? : warnBlock(warningArr[0]);
        }
    }
}

- (void)emptyCheckWithDictArr:(NSArray<NSDictionary *> *)dictArr
                  methodBlock:(MethodBlock)methodBlock
                 warningBlock:(WarnBlock)warningBlock {
    if (dictArr.count) {
        NSDictionary *dict = dictArr[0];
        if (![dict[@"content"] isEqualToString:@""]) {
            NSMutableArray *cMArr = [NSMutableArray arrayWithArray:dictArr];
            [cMArr removeObject:dictArr[0]];
            if (cMArr.count) {
                [self emptyCheckWithDictArr:cMArr methodBlock:methodBlock warningBlock:warningBlock];
            }else {
                !methodBlock ? : methodBlock();
            }
            
        }else {
            !warningBlock ? : warningBlock(dict[@"warning"]);
        }
    }
}

- (void)emptyCheckWithModelArr:(NSArray<XFEmptyCheckModel *> *)modelArr
                methodBlock:(MethodBlock)methodBlock
                waringBlock:(WarnBlock)warningBlock {
    if (modelArr.count) {
        XFEmptyCheckModel *model = modelArr[0];
        if (![model.content isEqualToString:@""]) {
            NSMutableArray *cMArr = [NSMutableArray arrayWithArray:modelArr];
            [cMArr removeObject:modelArr[0]];
            if (cMArr.count) {
                [self emptyCheckWithModelArr:cMArr methodBlock:methodBlock waringBlock:warningBlock];
            }else {
                !methodBlock ? : methodBlock();
            }
        }else {
            !warningBlock ? : warningBlock(model.warning);
        }
    }
}

- (void)checkEmptyWithDataArr:(NSArray *)dataArr
               methodBlock:(MethodBlock)methodBlock
              warningBlock:(WarnBlock)warningBlock {
    if (dataArr.count) {
        if ([dataArr[0] isKindOfClass:[XFEmptyCheckModel class]]) {
            XFEmptyCheckModel *model = dataArr[0];
            if (![model.content isEqualToString:@""]) {
                NSMutableArray *cMArr = [NSMutableArray arrayWithArray:dataArr];
                [cMArr removeObject:model];
                if (cMArr.count) {
                    [self emptyCheckWithModelArr:cMArr methodBlock:methodBlock waringBlock:warningBlock];
                }else {
                    !methodBlock ? : methodBlock();
                }
            }else {
                !warningBlock ? : warningBlock(model.warning);
            }
        }else if ([dataArr[0] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = dataArr[0];
            if (![dict[@"content"] isEqualToString:@""]) {
                NSMutableArray *cMArr = [NSMutableArray arrayWithArray:dataArr];
                [cMArr removeObject:dict];
                if (cMArr.count) {
                    [self emptyCheckWithDictArr:cMArr methodBlock:methodBlock warningBlock:warningBlock];
                }else {
                    !methodBlock ? : methodBlock();
                }
                
            }else {
                !warningBlock ? : warningBlock(dict[@"warning"]);
            }
        }
    }
}

@end
