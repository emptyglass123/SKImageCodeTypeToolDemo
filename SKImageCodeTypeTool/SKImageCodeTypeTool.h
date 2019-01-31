//
//  SKImageCodeTypeTool.h
//  SKImageCodeTypeTool
//
//  Created by pactera on 2019/1/30.
//  Copyright © 2019年 pactera_hui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKImageCodeTypeTool : NSObject


/**
 识别图片格式

 @param imageData image / NSData
 @return 图片格式字符串
 */
+ (NSString *)imageFormatFromImageData:(NSData *)imageData;
@end
