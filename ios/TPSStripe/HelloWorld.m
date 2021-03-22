//
//  HelloWorld.m
//  TPSStripe
//
//  Created by Danilo Gacevic on 22.3.21..
//  Copyright © 2021 Tipsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCT_EXTERN_MODULE(MyModule, NSObject)

RCT_EXTERN_METHOD(construct:(NSString*)name value:(NSInteger)value)

@end
