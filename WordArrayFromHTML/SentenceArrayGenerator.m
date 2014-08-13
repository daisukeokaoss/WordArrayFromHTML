//
//  SentenceArrayGenerator.m
//  WordArrayFromHTML
//
//  Created by おかやん on 2014/08/13.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "SentenceArrayGenerator.h"

//ユーザーインポート
#import "HTMLParser.h"


@interface SentenceArrayGenerator()

@property (nonatomic,strong) NSMutableData *receivedData;
@property (nonatomic,strong) NSString *html;

-(NSArray *)GenerateSentenceArrayFromURL:(NSURL *)url;

@end

@implementation SentenceArrayGenerator

-(NSArray *)GenerateSentenceArrayFromURL:(NSURL *)url
{
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (!connection) {
        NSLog(@"Connection error");
    }

    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:self.html error:&error];
    HTMLNode *bodyNode = [parser body];
    NSArray *aNodes = [bodyNode findChildTags:@"a"];
    for (HTMLNode *node in aNodes) {
        NSLog(@"%@", [node getAttributeNamed:@"href"]);
    }
    
    return
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.receivedData = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
     self.html = [[NSString alloc] initWithBytes:self.receivedData.bytes length:self.receivedData.length encoding:NSShiftJISStringEncoding];
}

@end
