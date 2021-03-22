#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(SwiftComponentManager, NSObject)

  RCT_EXTERN_METHOD(passValueFromReact:(NSString *)value) //Here exported your swift function for React Native
@end
