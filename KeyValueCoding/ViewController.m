//
//  ViewController.m
//  KeyValueCoding
//
//  Created by Kadir Kemal Dursun on 23/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"

@interface ViewController ()

@property StudentModel *student;
@property NSMutableArray *students;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.student = [StudentModel new];

//    [self standardUsage];
    
//    [self kvoUsageWithForKey];
//    [self kvoReachTheValueWithForKey];
    
//    [self kvoUsageWithForKeyPath];
//    [self kvoReachTheValueWithForKeyPath];
    
    [self createStudents];
    int maxScore  = [self maxScore];
    int minScore = [self minScore];
    double avgScore = [self averageScore];
    int sumOfScores = [self sumOfScores];
    NSArray *unionOfNames = [self unionOfNames];
    NSArray *distinctUnionOfNames = [self distinctUnionOfNames];
}

-(void) standardUsage{
    //set the variable
    self.student.name = @"George";
    //or you can use
    //[self.student setName:@"George"];
    
    //get the variable
    NSString *name = self.student.name;
    //or you can use
    //NSString *name = [self.student name];
    
    NSLog(@"%@", name);
}

-(void) kvoUsageWithForKey{
    //setting variable with setValue:forKey method
    [self.student setValue:@"George" forKey:@"name"];
}


-(void) kvoUsageWithForKeyPath{
    //setting variable with setValue:forKeyPath method
    [self setValue:@"George" forKeyPath:@"student.name"];
}

-(void) kvoReachTheValueWithForKey{
    NSString *name = [self.student valueForKey:@"name"];
    NSLog(@"%@", name);
}

-(void) kvoReachTheValueWithForKeyPath{
    NSString *name = [self valueForKeyPath:@"student.name"];
    NSLog(@"%@", name);
}

-(void) createStudents{
    _students = [NSMutableArray new];
    
    [_students addObject:[[StudentModel alloc] initWithName:@"Ted" testScore:80]];
    [_students addObject:[[StudentModel alloc] initWithName:@"Barney" testScore:67]];
    [_students addObject:[[StudentModel alloc] initWithName:@"Lily" testScore:45]];
    [_students addObject:[[StudentModel alloc] initWithName:@"Ted" testScore:55]];
    [_students addObject:[[StudentModel alloc] initWithName:@"Marshall" testScore:50]];
    [_students addObject:[[StudentModel alloc] initWithName:@"Robin" testScore:95]];
}

-(int) maxScore{
    return [[_students valueForKeyPath:@"@max.testScore"] intValue];
}

-(int) minScore{
    return [[_students valueForKeyPath:@"@min.testScore"] intValue];
}

-(double) averageScore{
    return [[_students valueForKeyPath:@"@avg.testScore"] doubleValue];
}

-(int) sumOfScores{
    return [[_students valueForKeyPath:@"@sum.testScore"] intValue];
}

-(NSArray *) unionOfNames{
    return [_students valueForKeyPath:@"@unionOfObjects.name"];
//    return [_students valueForKeyPath:@"name"]; //same result
}

-(NSArray *) distinctUnionOfNames{
    return [_students valueForKeyPath:@"@distinctUnionOfObjects.name"];
}


@end
