//
//  WorkVO.swift
//  GalleryGuide
//
//  Created by Elena on 07.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

struct WorkVO {
    var id:String
    var year:Int?
    var author:String?
    var Picture:String?
    var size:String?
    var title:String?
    var type:String?
}

extension WorkVO {
    
    static func loadWorks() -> [String: WorkVO] {
        
        var result:[String: WorkVO] = [:]
        
        if let array = DataLoader().load(resourse: "works") {
            
            for worksDictionary in array {
                
                let work = WorkVO(
                    id: worksDictionary["_id"] as! String,
                    year: worksDictionary["year"] as? Int,
                    author: worksDictionary["author"] as? String,
                    Picture: worksDictionary["imgPicture"] as? String,
                    size: worksDictionary["size"] as? String,
                    title: worksDictionary["title"] as? String,
                    type: worksDictionary["type"] as? String)
                
                
                result[work.id] = work
            }
        }
        
        return result
        
    }
}
