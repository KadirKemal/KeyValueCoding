//
//  StudentModel.h
//  KeyValueCoding
//
//  Created by Kadir Kemal Dursun on 23/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

-(instancetype) initWithName:(NSString *) name testScore:(int) testScore;

@property (nonatomic) NSString *name;
@property (nonatomic) int testScore;

@end
