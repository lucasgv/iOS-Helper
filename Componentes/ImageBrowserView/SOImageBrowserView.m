//
//  SOImageBrowserView.m
//  SOMessaging
//
// Created by : arturdev
// Copyright (c) 2014 SocialObjects Software. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

#import "SOImageBrowserView.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define kImageHeight 400.0f

@interface SOImageBrowserView()
{
    float degrees;
}

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *hideButton;
@property (strong, nonatomic) UIButton *rotateButton;
@property (strong, nonatomic) UIButton *saveButton;

@end

@implementation SOImageBrowserView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        self.backgroundView.alpha = 0;
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor = [UIColor clearColor];
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.hideButton.backgroundColor = [UIColor clearColor];
        [self.hideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.hideButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.hideButton setImage:[Utils colorImage:[UIImage imageNamed:@"ic-close"] withColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self.hideButton addTarget:self action:@selector(doneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.hideButton.frame = CGRectMake(15, 30, 50, 50);
        
        self.rotateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rotateButton.backgroundColor = [UIColor clearColor];
        [self.rotateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rotateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.rotateButton setImage:[UIImage imageNamed:@"rotate"] forState:UIControlStateNormal];
        [self.rotateButton addTarget:self action:@selector(rotateButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.rotateButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -60, 30, 40, 40);
        
        self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.saveButton.backgroundColor = [UIColor clearColor];
        [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.saveButton setTitle:@"Salvar" forState:UIControlStateNormal];
        [self.saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.saveButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -90, [UIScreen mainScreen].bounds.size.height - 50, 100, 40);

        
        [self addSubview:self.backgroundView];
        [self addSubview:self.imageView];
        [self addSubview:self.hideButton];
        [self addSubview:self.rotateButton];
        [self addSubview:self.saveButton];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
    
    if (self.strUrlImage == nil || [self.strUrlImage isEqualToString:@""])
    {
       self.imageView.image = self.image;
    }
    else
    {
        [MBProgressHUD showHUDAddedTo:self.imageView animated:YES];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.strUrlImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [MBProgressHUD hideAllHUDsForView:self.imageView animated:YES];
        }];
    }
    self.imageView.frame = self.startFrame;
    
    CGRect frame = CGRectZero;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    frame.size.height = kImageHeight;
    frame.origin.y = ([UIScreen mainScreen].bounds.size.height - kImageHeight)/2;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundView.alpha = 1;
        self.imageView.frame = frame;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    }];
}

- (void)hide
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [UIView animateWithDuration:0.3 animations:^{
        self.imageView.frame = self.startFrame;
        self.imageView.alpha = 0;
        self.backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)doneButtonTapped:(id)sender
{
    [self hide];
}

- (void)saveButtonTapped:(id)sender
{
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    
    if (status != ALAuthorizationStatusAuthorized) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Por favor verifique as permissões de acesso do aplciativo nos ajustes para poder salvar a foto!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, nil, nil, nil);
        [appdelegate showMessageWithTitle:@"Sucesso" message:@"Foto salva em suas mídias." delegate:nil view:self];
    }
}

- (void)rotateButtonTapped:(id)sender
{
    if (degrees == 360) {
        degrees = 0;
    }
    degrees = degrees +90;
    self.imageView.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
}

- (void)dealloc
{
    
}

@end
