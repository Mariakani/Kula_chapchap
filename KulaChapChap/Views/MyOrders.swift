//
//  MyOrders.swift
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
            List{
              // Section{
                    ForEach(order.items){ order in
                        HStack(alignment: .top, spacing: 5){
                            Image(order.thumbnailImage)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            Spacer()
                            VStack{
                                Text(order.name)
                                Text("$\(order.price)")
                            }
                        }
                    }.onDelete(perform: deleteItems)
              // }
                Section{
                    NavigationLink(destination: CheckoutView()){
                         Text("Place order")
                    }
                }.disabled(order.items.isEmpty)
            }
        .navigationBarTitle("My orders ")
        .listStyle(GroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}
