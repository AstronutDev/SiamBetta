//
//  FetchFirebaseData.swift
//  Siam Betta
//
//  Created by Supanut Laddayam on 2/11/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation
import Firebase

func fetchData(String: documentName) {
    let docRef = Firestore.firestore().collection("categories").document("documentName")
    docRef.getDocument { (snap, error) in
        guard let data = snap?.data() else {return}
        let name = data["name"] as! String ?? ""
        let imageUrl = data["imageUrl"] as! String ?? ""
        print(imageUrl)
        self.imageFirebase = imageUrl
    }
}
