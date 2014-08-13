//
//  SentenceArrayGenerator.h
//  WordArrayFromHTML
//
//  Created by おかやん on 2014/08/13.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SentenceArrayGenerator : NSObject<NSURLConnectionDataDelegate>

+(NSArray *)GenerateSentenceArrayFromURL: (NSURL *)url;

@end
