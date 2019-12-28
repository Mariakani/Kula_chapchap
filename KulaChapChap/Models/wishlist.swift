//
//  wishlist.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-25.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

class wishList : ObservableObject{
    @Published var wishListItems = [MenuItem]()
    var total: Int {
        if wishListItems.count > 0 {
            return wishListItems.reduce(0) { $0 + $1.price }
        } else
        {
            return 0
        }
    }
    
   func add(item: MenuItem) {
        wishListItems.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = wishListItems.firstIndex(of: item) {
            wishListItems.remove(at: index)
        }
    }
}
