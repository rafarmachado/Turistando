//
//  Funcionalidades.h
//  Turistando
//
//  Created by Rafael on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define USUARIO_JSON @"UserAu"
#define SENHA_JSON @"123456"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

#define URL_FALECONOSCO @"http://v2.zopim.com/widget/livechat.html?key=3EiarFRrrun6O7UsqCahmEXeaKJUFvR3&mid=bjfiRfjUc1ggp2&lang=pt_BR&hostname=santarosaurbanismo.com.br&api_calls=%5B%5D"

@interface Funcionalidades : NSObject


+(void)stopProgressBar:(UIView*)view;

+(void)startProgressSalvar:(UIView*)view;

+(void)startProgressCarregarPaises:(UIView *)view;

+ (NSString *) converteDataLocalString: (NSDate *) data;

+(void)startProgressCarregar:(UIView*)view;

+(void)Alerta:(NSString *)title msg:(NSString *)alerta;



@end
