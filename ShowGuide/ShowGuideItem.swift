//
//  ShowGuideItem.swift
//  Pods
//
//  Created by Wayne Rumble on 18/08/2016.
//
//

import Foundation
import Freddy

public struct ShowGuideItem {
    
    let name: String
    let text: String
    let iconFileName: String
    let backgroundImageFileName: String
    let chevronIconImageFileName: String
    let url: String
    
}

extension ShowGuideItem: JSONDecodable {
        
    public init(json: JSON) throws {
        name = try json.string("name")
        text = try json.string("text")
        iconFileName = try json.string("iconFileName")
        backgroundImageFileName = try json.string("backgroundImageFileName")
        chevronIconImageFileName = try json.string("chevronImageFileName")
        url = try json.string("url")
    }
        
}

extension ShowGuideItem {
    
    static func all(completion: ([ShowGuideItem]) -> ()) {
        let showGuideData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("ShowGuide", withExtension: "json")!)!
        do {
            let json = try JSON(data: showGuideData)
            let items: [ShowGuideItem] = try json.arrayOf("ShowGuideItems")
            completion(items)
        } catch {
            fatalError("Failed to load Show Guide Items from json file")
        }
    }
}
    

