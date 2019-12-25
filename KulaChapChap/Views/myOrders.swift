//
//  myOrders.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-21.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct myOrders: View {
      @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            List {
                Section{
                    ForEach(order.items){ order in
                        HStack{
                            Text(order.name)
                            Spacer()
                            Text("$\(order.price)")
                        }
                    }
                }
                Section{
                    NavigationLink(destination: CheckoutView()){
                         Text("Place order")
                    }
                }
            }
        .navigationBarTitle("My orders ")
        .listStyle(GroupedListStyle())
        }
    }
}
