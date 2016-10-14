//
//  ViewController.h
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKGraphRequest.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "MenuPrincipalViewController.h"
#import "Perfil.h"
#import "ModeloPerfil.h"
#import "DownloadImageView.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Funcionalidades.h"
#import "MenuPrincipalViewController.h"

@interface ViewController : UIViewController


//Actions
- (IBAction)botaoLogarFB:(id)sender;

@end

