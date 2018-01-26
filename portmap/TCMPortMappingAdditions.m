
#import "TCMPortMappingAdditions.h"


@implementation TCMPortMapping (TCMPortMappingAdditions)

+ (TCMPortMapping*)portMappingWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    TCMPortMapping *mapping = [TCMPortMapping portMappingWithLocalPort:[aDictionary[@"privatePort"] intValue] desiredExternalPort:[aDictionary[@"desiredPublicPort"] intValue] transportProtocol:TCMPortMappingTransportProtocolTCP userInfo:aDictionary[@"userInfo"]];
    [mapping setTransportProtocol:(TCMPortMappingTransportProtocol) [aDictionary[@"transportProtocol"] intValue]];
	return mapping;
}

- (NSDictionary *)dictionaryRepresentation {
	return @{@"userInfo": [self userInfo],
            @"privatePort": @(_localPort),
            @"desiredPublicPort": @(_desiredExternalPort),
            @"transportProtocol": @(_transportProtocol)};
}


@end
