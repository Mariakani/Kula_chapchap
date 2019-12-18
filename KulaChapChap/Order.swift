//
//  Order.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-18.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

class Order {
    var items = [MenuItem]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
