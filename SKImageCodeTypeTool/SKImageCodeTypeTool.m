//
//  SKImageCodeTypeTool.m
//  SKImageCodeTypeTool
//
//  Created by pactera on 2019/1/30.
//  Copyright © 2019年 pactera_hui. All rights reserved.
//

#import "SKImageCodeTypeTool.h"

@implementation SKImageCodeTypeTool

+ (NSString *)imageFormatFromImageData:(NSData *)imageData{
    
    uint8_t first_byte;
    [imageData getBytes:&first_byte length:1];
    switch (first_byte) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png"; // https://www.w3.org/TR/PNG-Structure.html
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
        case 0x52:
            if ([imageData length] < 12) {
                return nil;
            }
            
            NSString *dataString = [[NSString alloc] initWithData:[imageData subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([dataString hasPrefix:@"RIFF"] && [dataString hasSuffix:@"WEBP"]) {
                return @"image/webp";
            }
            
            return nil;
    }
    return nil;
}

@end
