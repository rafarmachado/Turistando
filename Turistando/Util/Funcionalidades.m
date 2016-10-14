//
//  Funcionalidades.m
//  Turistando
//
//  Created by Rafael on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import "Funcionalidades.h"


@implementation Funcionalidades

/**
 * Finaliza o progress progressBar
 * @author Luis Teodoro
 */
+(void)stopProgressBar:(UIView*)view{
    
    
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    
    UIActivityIndicatorView *tmpimg = (UIActivityIndicatorView *)[view viewWithTag:1];
    [tmpimg removeFromSuperview];
}

/**
 * Inicializa o progress de carregamento das rotas do mapa
 * @author Rafael Rezende Machado (rafael.machado@eticasolucoes.com.br)
 */

+(void)startProgressCarregarPaises:(UIView *)view{
    UIView * viewNew  = [[UIView alloc]init];
    viewNew.tag  = 1;
    
    viewNew.frame =CGRectMake(round((view.frame.size.width - 240) / 2), round((view.frame.size.height - 120) / 2), 240, 120);
    
    UIImage * image  = [UIImage imageNamed:@"activity.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(round((viewNew.frame.size.width - 240) / 2), round((viewNew.frame.size.height - 120) / 2), 240, 120);
    
    [viewNew addSubview:imageView];
    
    NSString *txt = @"Carregando Paises";
    UITextView *texto = [[UITextView alloc] init];
    NSRange rangeBold = [txt rangeOfString:@"BOLD"];
    UIFont *fontText = [UIFont boldSystemFontOfSize:16];
    NSDictionary *dictBoldText = [NSDictionary dictionaryWithObjectsAndKeys:fontText, NSFontAttributeName, nil];
    NSMutableAttributedString *mutAttrTextViewString = [[NSMutableAttributedString alloc] initWithString:txt];
    [mutAttrTextViewString setAttributes:dictBoldText range:rangeBold];
    [texto setAttributedText:mutAttrTextViewString];
    CGRect frameOriginal = texto.frame;
    frameOriginal.size.height = texto.contentSize.height;
    texto.frame =frameOriginal;
    [texto setText:txt];
    [texto setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
    [texto setTextColor:[UIColor whiteColor]];
    [texto setBackgroundColor:[UIColor clearColor]];
    
    
    texto.frame = CGRectMake(round((viewNew.frame.size.width - 170) / 2), round((viewNew.frame.size.height - 90) / 2), 180, 90);
    
    [viewNew addSubview:texto];
    
    
    
    UIActivityIndicatorView  *av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
    av.frame = CGRectMake(round((viewNew.frame.size.width - 50) / 2), round((viewNew.frame.size.height - 1) / 2), 50, 50);
    
    av.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [viewNew addSubview:av];
    
    [view addSubview:viewNew];
    [av startAnimating];
    
    viewNew.layer.masksToBounds = YES;
    viewNew.layer.cornerRadius = 10;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

+(void)startProgressSalvar:(UIView*)view{
    UIView * viewNew  = [[UIView alloc]init];
    viewNew.tag  = 1;
    
    viewNew.frame =CGRectMake(round((view.frame.size.width - 240) / 2), round((view.frame.size.height - 120) / 2), 240, 120);
    
    UIImage * image  = [UIImage imageNamed:@"activity.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(round((viewNew.frame.size.width - 240) / 2), round((viewNew.frame.size.height - 120) / 2), 240, 120);
    
    [viewNew addSubview:imageView];
    
    NSString *txt = @"Salvando viagem!";
    UITextView *texto = [[UITextView alloc] init];
    NSRange rangeBold = [txt rangeOfString:@"BOLD"];
    UIFont *fontText = [UIFont boldSystemFontOfSize:18];
    NSDictionary *dictBoldText = [NSDictionary dictionaryWithObjectsAndKeys:fontText, NSFontAttributeName, nil];
    NSMutableAttributedString *mutAttrTextViewString = [[NSMutableAttributedString alloc] initWithString:txt];
    [mutAttrTextViewString setAttributes:dictBoldText range:rangeBold];
    [texto setAttributedText:mutAttrTextViewString];
    CGRect frameOriginal = texto.frame;
    frameOriginal.size.height = texto.contentSize.height;
    texto.frame =frameOriginal;
    [texto setText:txt];
    [texto setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
    [texto setTextColor:[UIColor whiteColor]];
    [texto setBackgroundColor:[UIColor clearColor]];
    
    
    texto.frame = CGRectMake(round((viewNew.frame.size.width - 180) / 2), round((viewNew.frame.size.height - 90) / 2), 180, 90);
    
    
    [viewNew addSubview:texto];
    
    
    
    UIActivityIndicatorView  *av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
    av.frame = CGRectMake(round((viewNew.frame.size.width - 50) / 2), round((viewNew.frame.size.height - 1) / 2), 50, 50);
    
    av.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [viewNew addSubview:av];
    
    [view addSubview:viewNew];
    [av startAnimating];
    
    viewNew.layer.masksToBounds = YES;
    viewNew.layer.cornerRadius = 10;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

+(void)startProgressCarregar:(UIView*)view{
    UIView * viewNew  = [[UIView alloc]init];
    viewNew.tag  = 1;
    
    viewNew.frame =CGRectMake(round((view.frame.size.width - 240) / 2), round((view.frame.size.height - 120) / 2), 240, 120);
    
    UIImage * image  = [UIImage imageNamed:@"activity.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(round((viewNew.frame.size.width - 240) / 2), round((viewNew.frame.size.height - 120) / 2), 240, 120);
    
    [viewNew addSubview:imageView];
    
    NSString *txt = @"Carregando!";
    UITextView *texto = [[UITextView alloc] init];
    NSRange rangeBold = [txt rangeOfString:@"BOLD"];
    UIFont *fontText = [UIFont boldSystemFontOfSize:18];
    NSDictionary *dictBoldText = [NSDictionary dictionaryWithObjectsAndKeys:fontText, NSFontAttributeName, nil];
    NSMutableAttributedString *mutAttrTextViewString = [[NSMutableAttributedString alloc] initWithString:txt];
    [mutAttrTextViewString setAttributes:dictBoldText range:rangeBold];
    [texto setAttributedText:mutAttrTextViewString];
    CGRect frameOriginal = texto.frame;
    frameOriginal.size.height = texto.contentSize.height;
    texto.frame =frameOriginal;
    [texto setText:txt];
    [texto setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
    [texto setTextColor:[UIColor whiteColor]];
    [texto setBackgroundColor:[UIColor clearColor]];
    
    
    texto.frame = CGRectMake(round((viewNew.frame.size.width - 120) / 2), round((viewNew.frame.size.height - 90) / 2), 120, 90);
    
    
    [viewNew addSubview:texto];
    
    
    
    UIActivityIndicatorView  *av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
    av.frame = CGRectMake(round((viewNew.frame.size.width - 50) / 2), round((viewNew.frame.size.height - 1) / 2), 50, 50);
    
    av.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [viewNew addSubview:av];
    
    [view addSubview:viewNew];
    [av startAnimating];
    
    viewNew.layer.masksToBounds = YES;
    viewNew.layer.cornerRadius = 10;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

+ (NSString *) converteDataLocalString: (NSDate *) data{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *orignalDate  =  [dateFormatter stringFromDate: data];
    
    return orignalDate;
}

+(void)Alerta:(NSString *)title msg:(NSString *)alerta{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:alerta
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
