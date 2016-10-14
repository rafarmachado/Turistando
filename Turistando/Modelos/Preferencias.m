//
//  Preferencias.m
//  Carros
//
//  Created by Etica on 11/07/16.
//  Copyright © 2016 FVRR. All rights reserved.
//


#import "Preferencias.h"

@implementation Preferencias

// Esta classe salva as preferências do usuario no cache do dispositivo movel.
// @author Victor Freitas (victor.alves@eticasolucoes.com.br).
//
+(void)setString:(NSString *)valor chave:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:valor forKey:chave];
    [prefs synchronize];
}

+(NSString *) getString:(NSString *)chave{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *valor = [prefs stringForKey:chave];
    return valor;
}

+(void)setInteger:(NSInteger)valor chave:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:valor forKey:chave];
    [prefs synchronize];
}

+(NSInteger)getInteger:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger i = [prefs integerForKey:chave];
    return i;
}
@end
