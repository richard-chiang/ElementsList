//
//  Element.swift
//  Elements View
//
//  Created by Richard Chiang on 2016-12-26.
//  Copyright © 2016 Richard Chiang. All rights reserved.
//

import Foundation

struct Element {

    enum State: String {
      case Solid, Liquid, Gas, Artificial
    }
    
    let atomicNumber: Int
    let atomicWeight: Float
    let discoveryYear: String
    let group: Int
    let name: String
    let period: Int
    let radioactive: Bool
    let state: State
    let symbol: String
    
    let horizPos: Int
    let vertPos: Int
}

extension Element {
    enum ElementError: Error {
      case NoFileError, FileFormatError
    }
    
    static func loadElements() throws -> [Element] {
        guard let elementPath = Bundle.main.path(forResource: "Element", ofType: "plist") else {
            throw ElementError.NoFileError
        }
        
        guard let array = NSArray(contentsOfFile: elementPath) as? [[String: AnyObject]] else {
          throw ElementError.FileFormatError
        }
        
        var elements = [Element]()
        
        for rawElement in array {
          elements.append(Element.parseRaw(dict: rawElement))
        }

        return elements
    }
    
    static func parseRaw(dict: [String: AnyObject]) -> Element {
        let atomicNumber = dict["atomicNumber"] as! Int
        let atomicWeight = Float(dict["atomicWeight"] as! String) ?? 0
        let discoveryYear = dict["discoveryYear"] as! String
        let group = dict["group"] as! Int
        let name = dict["name"] as! String
        let period = dict["period"] as! Int
        let radioactive = dict["radioactive"] as! String == "True"
        let state = State(rawValue: dict["state"] as! String)!
        let symbol = dict["symbol"] as! String
        let horizPos = dict["horizPos"] as! Int
        let vertPos = dict["vertPos"] as! Int
        
        return Element(atomicNumber: atomicNumber,
                       atomicWeight: atomicWeight,
                       discoveryYear: discoveryYear,
                       group: group,
                       name: name,
                       period: period,
                       radioactive: radioactive,
                       state: state,
                       symbol: symbol,
                       horizPos: horizPos,
                       vertPos: vertPos)
    }
    
    
}
