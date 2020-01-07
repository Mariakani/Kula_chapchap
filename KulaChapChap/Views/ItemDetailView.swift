//
//  ItemDetailView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-20.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order:Order
    @EnvironmentObject var wishlist:wishList
    let item: MenuItem
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment: .bottomTrailing){
                    Image(item.mainImage)
                    Text("Photo:\(item.photoCredit)")
                        .padding(2)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
                
                Text(item.description)
                    .padding(5)
                HStack{
                    
                    
                    //create order now buttons
                    Button(action: {
                        //button actions
                        self.order.add(item:self.item)
                    }){
                        //button label customization
                        Text("Order now")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.green, lineWidth: 1))
                    }
                    
                    //create a space between the two buttons
                    Spacer()
                    Button(action: {
                        self.wishlist.add(item:self.item)
                    }){
                        Text("Add to Favorites")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.green, lineWidth: 1))
                    }
                }
                .navigationBarTitle(Text(item.name), displayMode: .inline)
            }
        }
    }
}
