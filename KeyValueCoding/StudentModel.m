//
//  StudentModel.m
//  KeyValueCoding
//
//  Created by Kadir Kemal Dursun on 23/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

-(instancetype) initWithName:(NSString *) name testScore:(int) testScore{
    self = [super init];
    if(self){
        _name = name;
        _testScore = testScore;
    }
    return self;
}

@end
