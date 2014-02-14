//
//  XMLParser.h
//  iOSTopics
//
//  Created by Instructor on 14/01/14.
//  Copyright (c) 2014 Instructor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Courses_Model.h"

enum ParseStatus {PARSE_ERROR,NETWORK_ISSUE,SUCCESSFUL};
typedef enum ParseStatus ParseStatus;

@protocol XMLParserDelegate <NSObject>

-(void) doneParsingWithData:(NSArray *)arr Status:(ParseStatus) status;

@end

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *parser;
    bool shouldCaptureInformation;
    NSMutableString *capturedData;
    NSMutableArray *parsedOutData;
    Courses_Model *tempObject;
}
@property (assign,nonatomic) id<XMLParserDelegate> delegate;

@end
