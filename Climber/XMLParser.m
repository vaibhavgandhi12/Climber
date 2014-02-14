//
//  XMLParser.m
//  iOSTopics
//
//  Created by Instructor on 14/01/14.
//  Copyright (c) 2014 Instructor. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser
@synthesize delegate;

-(instancetype) init
{
    if([super init])
    {
        parsedOutData = [[NSMutableArray alloc] init];
        capturedData = [[NSMutableString alloc] init];
        shouldCaptureInformation = FALSE;
        parser = nil;
        [NSThread detachNewThreadSelector:@selector(startParsing) toTarget:self withObject:Nil];
    }
    return self;
}

-(void) startParsing
{
    //NSLog(@"startParsing");
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *path = [bundlePath stringByAppendingPathComponent:@"courseware_datasource.xml"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    bool parseResult = [parser parse];
    if(!parseResult)
    {
        if(delegate != nil)
        {
            [delegate doneParsingWithData:parsedOutData Status:PARSE_ERROR];
        }
    }
}

#pragma mark -
#pragma mark PROTOCOLS
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    //NSLog(@"parserDidStartDocument");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    //NSLog(@"parserDidEndDocument");
    
    if(delegate != nil)
    {
        [delegate doneParsingWithData:parsedOutData Status:SUCCESSFUL];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"didStartElement %@",elementName);
    if([elementName isEqualToString:@"course"])
    {
        tempObject = [[Courses_Model alloc] init];
        tempObject.lesson = [[NSMutableArray alloc] init];
    }
    shouldCaptureInformation = TRUE;
    capturedData = [[NSMutableString alloc] init];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //NSLog(@"didEndElement %@",elementName);
    if([elementName isEqualToString:@"course"])
    {
        [parsedOutData addObject:tempObject];
//        Courses_Model *temp = [parsedOutData objectAtIndex:0];
//        NSLog(@"total time: %@", temp.total_time);
        tempObject = [[Courses_Model alloc] init];
        tempObject.lesson = nil;
    }
    else if ([elementName isEqualToString:@"name"])
    {
        tempObject.course_name = capturedData;
    }
    else if ([elementName isEqualToString:@"description"])
    {
        tempObject.description = capturedData;
    }
    else if ([elementName isEqualToString:@"image"])
    {
        tempObject.image = capturedData;
    }
    else if ([elementName isEqualToString:@"publisher"])
    {
        tempObject.publisher = capturedData;
    }
    else if ([elementName isEqualToString:@"publisher_youtube_channel"])
    {
        tempObject.publisher_youtube_url = capturedData;
    }
    else if ([elementName isEqualToString:@"publisher_website_url"])
    {
        tempObject.publisher_url = capturedData;
    }
    else if ([elementName isEqualToString:@"total_lessons"])
    {
        tempObject.total_lessons = capturedData;
    }
    else if ([elementName isEqualToString:@"total_time"])
    {
        tempObject.total_time = capturedData;
    }
    else if ([elementName isEqualToString:@"serial"])
    {
        tempObject.serial = capturedData;
    }
    else if ([elementName isEqualToString:@"lesson_name"])
    {
        tempObject.lesson_name = capturedData;
    }
    else if ([elementName isEqualToString:@"url"])
    {
        tempObject.url = capturedData;
    }
    else if ([elementName isEqualToString:@"time"])
    {
        tempObject.time = capturedData;
    }
    else if ([elementName isEqualToString:@"thumbnail_image"])
    {
        tempObject.thumbnail_image = capturedData;
    }
    else if ([elementName isEqualToString:@"lesson_info"])
    {
        tempObject.temp = [[NSArray alloc] initWithObjects:tempObject.serial, tempObject.lesson_name, tempObject.url, tempObject.time, tempObject.thumbnail_image, nil];
        [tempObject.lesson addObject:tempObject.temp];
    }
    
    shouldCaptureInformation = FALSE;
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // NSLog(@"foundCharacters %@",capturedData);
    if(shouldCaptureInformation)
    {
        [capturedData appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    //NSLog(@"parseErrorOccurred %@",[parseError description]);
    if(delegate != nil)
    {
        [delegate doneParsingWithData:parsedOutData Status:PARSE_ERROR];
    }
}
@end
