//
//  CRSTextReader.h
//  crs-ios
//
//  Created by Brian Osborn on 7/22/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Read through text string
 */
@interface CRSTextReader : NSObject

/**
 * Parameter name
 */
@property (nonatomic) BOOL includeQuotes;

/**
 *  Initialize
 *
 *  @param text text
 *
 *  @return new text reader
 */
+(CRSTextReader *) createWithText: (NSString *) text;

/**
 *  Initialize
 *
 *  @param text text
 *  @param includeQuotes
 *            include quotes
 *
 *  @return new text reader
 */
+(CRSTextReader *) createWithText: (NSString *) text andIncludeQuotes: (BOOL) includeQuotes;

/**
 *  Initialize
 *
 *  @param text text
 *
 *  @return new text reader
 */
-(instancetype) initWithText: (NSString *) text;

/**
 *  Initialize
 *
 *  @param text text
 *  @param includeQuotes
 *            include quotes
 *
 *  @return new text reader
 */
-(instancetype) initWithText: (NSString *) text andIncludeQuotes: (BOOL) includeQuotes;

/**
 *  Get the text
 *
 *  @return text
 */
-(NSString *) text;

/**
 * Reset the reader
 */
-(void) reset;

/**
 * Read the next token. Ignores whitespace until a non whitespace character
 * is encountered. Returns a contiguous block of token characters ( [a-z] |
 * [A-Z] | [0-9] | - | . | + | : | _ ) or a non whitespace single character.
 *
 * @return token
 */
-(NSString *) readToken;

/**
 * Peek at the next token without reading past it
 *
 * @return next token
 */
-(NSString *) peekToken;

/**
 * Peek at a token without reading past it
 *
 * @param num
 *            number of tokens out to peek at
 * @return token
 * @throws IOException
 *             upon read error
 */
-(NSString *) peekTokenAtNum: (int) num;

/**
 * Push a token back onto the read cache
 *
 * @param token
 *            token
 */
-(void) pushToken: (NSString *) token;

/**
 * Read an expected token
 *
 * @return token
 */
-(NSString *) readExpectedToken;

/**
 * Peek at the next expected token without reading past it
 *
 * @return next token
 */
-(NSString *) peekExpectedToken;

/**
 * Peek at the next expected token without reading past it
 *
 * @param num
 *            number of tokens out to peek at
 * @return token
 */
-(NSString *) peekExpectedTokenAtNum: (int) num;

/**
 * Read a signed number as a double
 *
 * @return signed double
 */
-(double) readNumber;

/**
 * Read an unsigned number as a double
 *
 * @return unsigned double
 */
-(double) readUnsignedNumber;

/**
 * Read a signed integer
 *
 * @return signed integer
 */
-(int) readInteger;

/**
 * Read an unsigned integer
 *
 * @return unsigned integer
 */
-(int) readUnsignedInteger;

@end
