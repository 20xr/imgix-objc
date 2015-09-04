#import "IGXFit.h"

NSString * IGXFitString(IGXFit fit) {
	switch (fit){
		case IGXFitClamp: return @"clamp";
		case IGXFitClip: return @"clip";
		case IGXFitCrop: return @"crop";
		case IGXFitFaceArea: return @"facearea";
		case IGXFitFill: return @"fill";
		case IGXFitMax: return @"max";
		case IGXFitMin: return @"min";
		case IGXFitScale: return @"scale";
	}
}

IGXFit IGXFitFromString(NSString * string) {
	if (!string || string.length == 0) {
		return IGXFitClip;
	}
	
	string = [string lowercaseString];
	
	if ([string isEqualToString:@"clamp"])
		return IGXFitClamp;
	else if ([string isEqualToString:@"clip"])
		return IGXFitClip;
	else if ([string isEqualToString:@"crop"])
		return IGXFitCrop;
	else if ([string isEqualToString:@"facearea"])
		return IGXFitFaceArea;
	else if ([string isEqualToString:@"fill"])
		return IGXFitFill;
	else if ([string isEqualToString:@"max"])
		return IGXFitMax;
	else if ([string isEqualToString:@"min"])
		return IGXFitMin;
	else if ([string isEqualToString:@"scale"])
		return IGXFitScale;
	
	return IGXFitClip;
}

