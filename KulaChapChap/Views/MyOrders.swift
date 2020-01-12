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
    var totalPrice: Double{
        let  total  = Double(order.total)
        return total
    }
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ order in
                        OrderItemRow(item: order)
                    }.onDelete(perform: deleteItems)
                }
                
                if(order.items.isEmpty){
                    Text("It looks like your food basket is empty, Navigate to Menu page and add more")
                        .font(.body)
                }else{
                    Section{
                        HStack{
                            Text("Total amounnt due: ")
                            Spacer()
                            Text("$\(totalPrice, specifier: "%.2f")")
                        }
                    }
                    Section{
                        NavigationLink(destination: CheckoutView()){
                            Text("Place order")
                                .font(.largeTitle)
                                .background(Color.white)
                                .foregroundColor(.green)
                                .padding(10)
                                .cornerRadius(10)
                        }
                    }
                }
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







struct OrderItemRow: View{
    let item: MenuItem
    var body: some View{
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            Text(item.name)
                .font(.headline)
            Spacer()
            Text(" Amount $\(item.price) ")
                .font(.caption)
                .background(Color.white)
                .foregroundColor(.green)
                .padding(4)
                .cornerRadius(10)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.green.opacity(0.95), lineWidth: 1)
            )
        }
    }
}
