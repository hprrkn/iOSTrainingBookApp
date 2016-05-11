//
//  Book.m
//  BookApp
//
//  Created by 堀﨑 寛之 on 2016/05/11.
//  Copyright © 2016年 堀﨑 寛之. All rights reserved.
//

#import "Book.h"


@interface Book()

//@property (weak, nonatomic) NSArray *volumeInfo;
//@property (weak, nonatomic) NSString *title;
//@property (weak, nonatomic) NSString *subTitle;
//@property (weak, nonatomic) NSString *author;
//@property (weak, nonatomic) NSString *infoLink;
//@property (weak, nonatomic) NSArray *imageLinks;
//@property (weak, nonatomic) NSString *smallThumbnail;
//@property (weak, nonatomic) NSString *thumbnail;
//@property (weak, nonatomic) NSString *previewLink;
//@property (weak, nonatomic) NSArray *categories;
//@property (weak, nonatomic) NSString *description;

@end
@implementation Book


- (instancetype)init:(NSArray *) item
{
    self = [super init];
    if (self) {
        [self castJsonToBookClass:item];
    }
    return self;
}

- (void) castJsonToBookClass:(NSArray *)item
{
    self.volumeInfo = [item valueForKeyPath:@"volumeInfo"];
    self.title = [item valueForKeyPath:@"title"];
}

@end

//volumeInfo = {
//    authors =                 (
//                               "Robert Layton",
//                               "Paul A Watters"
//                               );
//    canonicalVolumeLink = "http://books.google.co.jp/books/about/Automating_Open_Source_Intelligence.html?hl=&id=XVeZBQAAQBAJ";
//    categories =                 (
//                                  Computers
//                                  );
//    description = "Algorithms for Automating Open Source Intelligence (OSINT) presents information on the gathering of information and extraction of actionable intelligence from openly available sources, including news broadcasts, public repositories, and more recently, social media. As OSINT has applications in crime fighting, state-based intelligence, and social research, this book provides recent advances in text mining, web crawling, and other algorithms that have led to advances in methods that can largely automate this process. The book is beneficial to both practitioners and academic researchers, with discussions of the latest advances in applications, a coherent set of methods and processes for automating OSINT, and interdisciplinary perspectives on the key problems identified within each discipline. Drawing upon years of practical experience and using numerous examples, editors Robert Layton, Paul Watters, and a distinguished list of contributors discuss Evidence Accumulation Strategies for OSINT, Named Entity Resolution in Social Media, Analyzing Social Media Campaigns for Group Size Estimation, Surveys and qualitative techniques in OSINT, and Geospatial reasoning of open data. Presents a coherent set of methods and processes for automating OSINT Focuses on algorithms and applications allowing the practitioner to get up and running quickly Includes fully developed case studies on the digital underground and predicting crime through OSINT Discusses the ethical considerations when using publicly available online data";
//    imageLinks =                 {
//        smallThumbnail = "http://books.google.co.jp/books/content?id=XVeZBQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
//        thumbnail = "http://books.google.co.jp/books/content?id=XVeZBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api";
//    };
//    infoLink = "http://books.google.co.jp/books?id=XVeZBQAAQBAJ&dq=ruby+intitle&hl=&source=gbs_api";
//    
//    previewLink = "http://books.google.co.jp/books?id=XVeZBQAAQBAJ&pg=PA10&dq=ruby+intitle&hl=&cd=2&source=gbs_api";
//    
//    subtitle = "Algorithms for OSINT";
//    title = "Automating Open Source Intelligence";
//};
