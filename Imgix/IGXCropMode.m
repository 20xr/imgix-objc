//
//  IGXCropMode.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXCropMode.h"

NSString * IGXCropModeString(IGXCropMode format) {
	switch (format) {
		case IGXCropModeCenter:
			return nil;
		case IGXCropModeTop:
			return @"top";
		case IGXCropModeBottom:
			return @"bottom";
		case IGXCropModeLeft:
			return @"left";
		case IGXCropModeRight:
			return @"right";
		case IGXCropModeFaces:
			return @"faces";
	}
	return nil;
}

IGXCropMode IGXCropModeFromString(NSString * string) {
	if (nil == string || 0 == string.length)
		return IGXCropModeCenter;
	
	string = [string lowercaseString];
	
	if ([string isEqualToString:@"top"])
		return IGXCropModeTop;
	else if ([string isEqualToString:@"bottom"])
		return IGXCropModeBottom;
	else if ([string isEqualToString:@"left"])
		return IGXCropModeLeft;
	else if ([string isEqualToString:@"right"])
		return IGXCropModeRight;
	else if ([string isEqualToString:@"faces"])
		return IGXCropModeFaces;
	
	return IGXCropModeCenter;
}

