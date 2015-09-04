@import Foundation;

#import "IGXNullability.h"

typedef NS_ENUM(NSUInteger, IGXFit) {
	IGXFitClip,
	IGXFitClamp,
	IGXFitCrop,
	IGXFitFaceArea,
	IGXFitFill,
	IGXFitMax,
	IGXFitMin,
	IGXFitScale
};

extern  NSString * __igx_nullable IGXFitString(IGXFit fit);
extern  IGXFit IGXFitFromString(NSString *__igx_nullable string);
