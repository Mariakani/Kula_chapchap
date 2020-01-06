//
//  ItemsView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-18.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    @EnvironmentObject var order:Order
    @EnvironmentObject var wishlist:wishList
    
    static let colors: [String: Color] = ["D" :.purple, "G":.black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    @State private var isActive = false
    var body: some View{
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(item.name)
                        .foregroundColor(.white)
                        .font(Font.headline)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(12)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.05))
                }.background(Color.black.opacity(0.5))
                    .background(Image(item.mainImage)
                        .scaledToFit()
                        .padding(.all, 1))
            }.background(Color.white)
                .clipped()
            Spacer()
            HStack{
                Text(" Price $\(item.price) ")
                    .font(.caption)
                    .background(Color.white)
                    .foregroundColor(.green)
                    .padding(4)
                    .cornerRadius(10)
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(Color.green.opacity(0.95), lineWidth: 1)
                )
                Spacer()
                Text("Restrictions:")
                    .font(.body)
                ForEach(item.restrictions,  id: \.self){ restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(ItemsView.self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action:{
                    self.isActive.toggle()
                }){
                    Text("More details")
                        .fontWeight(.medium)
                        .font(.caption)
                        .foregroundColor(.green)
                        .padding(4)
                        .cornerRadius(10)
                        .overlay(
                            Capsule(style: .continuous)
                                .stroke(Color.green.opacity(0.95), lineWidth: 1)
                    )
                }.sheet(isPresented: self.$isActive) {
                    ItemDetailView(item: self.item)
                        .environmentObject(self.order)
                        .environmentObject(self.wishlist)
                }
            }
        }
    }
}

