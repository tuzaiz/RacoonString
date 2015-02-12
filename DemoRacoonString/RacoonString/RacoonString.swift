//
//  RacoonString.swift
//  DemoRacoonString
//
//  Created by Henry Tseng on 2015/2/12.
//  Copyright (c) 2015年 Cloudbay. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public func length() -> Int! {
        return countElements(self)
    }
    
    public func match(str : String) -> Range<String.Index>? {
        return self.rangeOfString(str)
    }
    
    public func match(regex:NSRegularExpression) -> [[String]]? {
        let results = regex.matchesInString(self, options: nil, range: NSMakeRange(0, self.length())) as? [NSTextCheckingResult]
        if let results = results {
            var resultComponent : [[String]] = []
            for result in results {
                var ranges : [Range<String.Index>] = []
                for var i = 0; i < result.numberOfRanges; i++ {
                    ranges.append(self.convertRange(result.rangeAtIndex(i)))
                }
                var strings : [String] = []
                for range in ranges {
                    var string = self.substringWithRange(range)
                    strings.append(string)
                }
                resultComponent.append(strings)
            }
            return resultComponent
        } else {
            return nil
        }
    }
    
    public func splitBy(character : Character) -> [String]? {
        return split(self, {$0==character}, maxSplit: Int.max, allowEmptySlices: false)
    }
    
    public func sub(string : String, _ withString : String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: withString, options: .LiteralSearch, range: nil)
    }
    
    public func sub(r : Range<Int>, _ withString : String) -> String {
        let startIndex = advance(self.startIndex, r.startIndex)
        let endIndex = advance(startIndex, r.endIndex - r.startIndex)
        let range = Range(start: startIndex, end: endIndex)
        return self.stringByReplacingCharactersInRange(range, withString: withString)
    }
    
    public func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    public func escape() -> String? {
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    }
    
    public func unescape() -> String? {
        return self.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    }
    
    public func color() -> UIColor? {
        let regex = "^#{1}([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})$".regex()!
        if let matches = self.match(regex) {
            if matches.count > 0 {
                let allHex = matches[0]
                let rHex = allHex[1]
                let gHex = allHex[2]
                let bHex = allHex[3]
                let rScanner = NSScanner(string: rHex)
                let gScanner = NSScanner(string: gHex)
                let bScanner = NSScanner(string: bHex)
                var r : CUnsignedInt = 0
                var g : CUnsignedInt = 0
                var b : CUnsignedInt = 0
                rScanner.scanHexInt(&r)
                gScanner.scanHexInt(&g)
                bScanner.scanHexInt(&b)
                return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
            }
        }
        return nil
    }
    
    public func regex() -> NSRegularExpression? {
        return NSRegularExpression(pattern: self)
    }
    
    public func convertRange(range : NSRange) -> Range<String.Index> {
        let start = advance(self.startIndex, range.location)
        let end = advance(start, range.length)
        let swiftRange = Range<String.Index>(start: start, end: end)
        return swiftRange
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = advance(self.startIndex, r.startIndex)
            let endIndex = advance(startIndex, r.endIndex - r.startIndex)
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}

extension NSRegularExpression {
    convenience init?(pattern : String) {
        self.init(pattern: pattern, options: .CaseInsensitive, error: nil)
    }
}