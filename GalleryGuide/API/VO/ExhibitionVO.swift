//
//  ExhibitionVO.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

extension Date {
    static func from(string:String?) -> Date? {
        
        guard let string = string else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        return dateFormatter.date(from: string)
    }
}

import Foundation

struct ExhibitionVO {
    
    var id:String?
    var name:String
    var about:String?
    var authorName:String?
    var authorDescription:String?
    var startDate:Date?
    var endDate:Date?
    var gallery:GalleryVO
    var works:[WorkVO]
}

extension ExhibitionVO {

    static func loadExhibitions() -> [ExhibitionVO]  {
    
        let galleries = GalleryVO.loadGalleries()
        let works = WorkVO.loadWorks()
    
        var result:[ExhibitionVO] = []
        
        if let array = DataLoader().load(resourse: "exhibitions") {
            for exhibitionDictionary in array {
            
                var galleryID:String = exhibitionDictionary["_p_gallery"] as! String
                galleryID = galleryID.components(separatedBy: "$").last!
                
                
            
                if let gallery = galleries[galleryID] {
                    
                    var exhibitionWorks:[WorkVO] = []
                    
                    guard let worksID:[[String:String]] = exhibitionDictionary["works"] as? [[String:String]] else {
                        continue
                    }
                    for exhibitionsWorks in worksID {
                        let workId = exhibitionsWorks["objectId"]!
                        let work = works[workId]
                        exhibitionWorks.append(work!)
                        
                    }

                
                    let exhibition = ExhibitionVO(
                        id: exhibitionDictionary["_id"] as? String,
                        name: exhibitionDictionary["name"] as! String,
                        about: exhibitionDictionary["about"] as? String,
                        authorName: exhibitionDictionary["authorName"] as? String,
                        authorDescription: exhibitionDictionary["authorDescription"] as? String,
                        startDate: Date.from(string: exhibitionDictionary["dateStart"] as? String),
                        endDate: Date.from(string: exhibitionDictionary["dateEnd"] as? String),
                        gallery: gallery,
                        works: exhibitionWorks)
                
                    result.append(exhibition)
                }
            }
        }
    
        return result
    }
}

