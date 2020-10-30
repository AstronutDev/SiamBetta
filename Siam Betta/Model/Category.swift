//
//  Category.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 4/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation

struct Category {
    var name: String
    var imgUrl: String
    var detail: String
    
    var bodyImageUrl: String
    var bodyDetail: String
    
    var backFinImage: String
    var backFinDetail: String
    
    var chestFinImage: String
    var chestFinDetail: String
    
    var paunchFinImage: String
    var paunchFinDetail: String
    
    var tailFinImage: String
    var tailFinDetail: String
    
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.imgUrl = data["imageUrl"] as? String ?? ""
        self.detail = data["detail"] as? String ?? ""
        self.bodyDetail = data["bodyDetail"] as? String ?? ""
        self.bodyImageUrl = data["bodyImageUrl"] as? String ?? ""
            
        self.backFinImage = data["backFinImage"] as? String ?? ""
        self.backFinDetail = data["backFinDetail"] as? String ?? ""
        
        self.chestFinImage = data["chestFinImage"] as? String ?? ""
        self.chestFinDetail = data["chestFinDetail"] as? String ?? ""
        
        self.paunchFinImage = data["paunchFinImage"] as? String ?? ""
        self.paunchFinDetail = data["paunchFinDetail"] as? String ?? ""
        
        self.tailFinImage = data["tailFinImage"] as? String ?? ""
        self.tailFinDetail = data["tailFinDetail"] as? String ?? ""
    }
}
