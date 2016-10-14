//
//  Preferencias.h
//  Carros
//
//  Created by Etica on 11/07/16.
//  Copyright © 2016 FVRR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferencias : NSObject

+(void)setString:(NSString *)valor chave:(NSString *)chave;
+(NSString *) getString:(NSString *)chave;
+(void)setInteger:(NSInteger)valor chave:(NSString *)chave;
+(NSInteger) getInteger:(NSString *)chave;

@end
