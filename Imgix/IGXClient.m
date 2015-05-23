//
//  IGXClient.m
//  Imgix
//
//  Created by Sam Soffes on 5/22/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"
#import "NSString+Imgix.h"

@interface IGXClient ()
@property (nonnull, nonatomic, readwrite) NSString *host;
@property (nullable, nonatomic, readwrite) NSString *token;
@property (nonatomic) NSMutableDictionary *options;
@end

@implementation IGXClient

#pragma mark - Accessors

@synthesize options = _options;
@synthesize host = _host;
@synthesize token = _token;
@synthesize secure = _secure;


#pragma mark - Initializers

- (instancetype)init {
	if ((self = [super init])) {
		self.secure = YES;
	}
	return self;
}

- (nonnull instancetype)initWithHost:(nonnull NSString *)host token:(nullable NSString *)token {
	if ((self = [self init])) {
		self.host = host;
		self.token = token;
	}
	return self;
}


#pragma mark - Configuration

- (NSMutableDictionary *)options {
	if (!_options) {
		_options = [[NSMutableDictionary alloc] init];
	}
	return _options;
}


#pragma mark - URL Building

- (NSString *)queryStringWithPath:(NSString *)path {
	NSMutableArray *components = [[NSMutableArray alloc] init];
	NSArray *keys = [[self.options allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
	[keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
		id value = self.options[key];
		[components addObject:[[NSString alloc] initWithFormat:@"%@=%@", key, value]];
	}];

	NSString *query = [components componentsJoinedByString:@"&"];

	if (self.token) {
		NSString *input = [[NSString alloc] initWithFormat:@"%@%@?%@", self.token, path, query];
		NSString *signature = [input imgix_MD5];
		[components addObject:[[NSString alloc] initWithFormat:@"s=%@", signature]];
		query = [components componentsJoinedByString:@"&"];
	}

	return query;
}

- (nullable NSURL *)URLWithPath:(nonnull NSString *)path {
	NSString *scheme = self.secure ? @"https" : @"http";

	if (![path hasPrefix:@"/"]) {
		path = [@"/" stringByAppendingString:path];
	}

	NSString *query = [self queryStringWithPath:path];
	if (query.length > 0) {
		query = [@"?" stringByAppendingString:query];
	}

	NSString *string = [[NSString alloc] initWithFormat:@"%@://%@%@%@", scheme, self.host, path, query];
	return [[NSURL alloc] initWithString:string];
}

@end
