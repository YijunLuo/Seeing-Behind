//
//  OpenCVWrapper.h
//  Seeing-Behind-Alpha
//
//  Created by lyjtour on 3/14/18.
//  Copyright © 2018 lyjtour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface OpenCVWrapper : NSObject
+ (void) setflag;
+ (NSString *)openCVVersionString;
+ (UIImage *)stitchWithOpenCV:(NSArray *)images;
+ (UIImage *) startTest:(UIImage *)pimage1 image2:(UIImage *)pimage2;
@end
