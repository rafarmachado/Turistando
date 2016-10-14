//
//  HttpAsyncHelperDelegate.h
//  Turistando
//
// Created by Mac Mini on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpAsyncHelperDelegate <NSObject>
@required

//Ok
-(void)requestEndWithData:(NSData *)data;

//Erro
-(void)requestEndWithError:(NSError *)error;

@end
