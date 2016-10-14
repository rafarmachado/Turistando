//
//  DownloadImageView.h
//  Turistando
//
//  Created by Rafael on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadImageView : UIImageView{
    NSString *url;
    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
}

@property (nonatomic, copy)NSString *url;

@end
