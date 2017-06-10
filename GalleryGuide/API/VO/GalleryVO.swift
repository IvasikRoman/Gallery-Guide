//
//  GalleryVO.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

struct GalleryVO {
    
    var id:                 String!
    var name:               String!
    var galleryDescription: String?
    var email:              String?
    var facebook:           String?
    var city:               String?
    var schedule:           String?
    var address:            String?
    var logo:               String?
    var link:               String?
    var phone:              Int?
    var latitude:           Double?
    var longitude:          Double?
    var works:              [WorkVO]
    
    
}

extension GalleryVO {

    static func loadGalleries() -> [String: GalleryVO] {
        
        var result:[String: GalleryVO] = [:]
    
        if let array = DataLoader().load(resourse: "galleries") {
            
            
            for galleryDictionary in array {
                
                var galleryWorks:[WorkVO] = []
                
                for exhibitionsInGallery in ExhibitionsModel.instance.exhibitions {
                    if exhibitionsInGallery.gallery.name == galleryDictionary["name"] as! String {
                        
                        galleryWorks += exhibitionsInGallery.works
                    }
                }

            
                let gallery = GalleryVO(
                    id: galleryDictionary["_id"] as! String,
                    name: galleryDictionary["name"] as! String,
                    galleryDescription: galleryDictionary["galleryDescription"] as? String,
                    email: galleryDictionary["email"] as? String,
                    facebook: galleryDictionary["facebook"] as? String,
                    city: galleryDictionary["city"] as? String,
                    schedule: galleryDictionary["schedule"] as? String,
                    address: galleryDictionary["address"] as? String,
                    logo: galleryDictionary["logo"] as? String,
                    link: galleryDictionary["link"] as? String,
                    phone: galleryDictionary["phone"] as? Int,
                    latitude: galleryDictionary["latitude"] as? Double,
                    longitude: galleryDictionary["longitude"] as? Double,
                    works: galleryWorks)

                result[gallery.id] = gallery
            }
        }
    
        return result
    }
}

