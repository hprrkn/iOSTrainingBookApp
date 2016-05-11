//
//  Book.h
//  BookApp
//
//  Created by 堀﨑 寛之 on 2016/05/11.
//  Copyright © 2016年 堀﨑 寛之. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (weak, nonatomic) NSString *bookDescription;
@property (weak, nonatomic) NSArray *volumeInfo;
@property (weak, nonatomic) NSString *title;
@property (weak, nonatomic) NSString *subTitle;
@property (weak, nonatomic) NSString *author;
@property (weak, nonatomic) NSString *infoLink;
@property (weak, nonatomic) NSArray *imageLinks;
@property (weak, nonatomic) NSString *smallThumbnail;
@property (weak, nonatomic) NSString *thumbnail;
@property (weak, nonatomic) NSString *previewLink;
@property (weak, nonatomic) NSArray *categories;

- (instancetype)init:(NSArray *) item;

- (void) castJsonToBookClass:(NSArray *) item;

@end
