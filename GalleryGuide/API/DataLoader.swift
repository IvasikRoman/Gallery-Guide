//
//  DataLoader.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

class DataLoader {
    
    func load(resourse: String) -> [[String: Any]]? {
        
        guard let url = Bundle.main.url(forResource: resourse, withExtension: "json") else {
            return [[:]]
        }
        
        guard let rawData = try? Data(contentsOf: url) else {
            return [[:]]
        }
        
        guard let rawArray = try? JSONSerialization.jsonObject(with: rawData) as? [[String: Any]] else {
            return [[:]]
        }
        
        return rawArray
    }
}

// make some changes!!!
