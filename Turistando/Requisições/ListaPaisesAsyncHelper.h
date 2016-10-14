//
//  HttpAsyncHelper.h
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPAsyncHelperDelegate.h"

@interface ListaPaisesAsyncHelper : NSObject <NSURLConnectionDataDelegate>{
    
    //Retorno do HTTP
    NSMutableData *retornoHttp;
    
    id <HttpAsyncHelperDelegate> delegate;
}

@property (retain) id delegate;

-(void) doGet:(NSString *)url;

@end
