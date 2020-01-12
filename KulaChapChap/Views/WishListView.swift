//
//  WishListView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-25.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct WishListView: View {
    @EnvironmentObject var wishlist: wishList
    var body: some View {
        NavigationView{
            List{
                ForEach(wishlist.wishListItems){ item in
                    WishlistItemRow(item: item)
                }.onDelete(perform: deleteItems)
            }
            .navigationBarTitle("My Favourites")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet){
        wishlist.wishListItems.remove(atOffsets: offsets)
    }
}





//view for the wishlist
struct WishlistItemRow: View {
    let item: MenuItem
    var body: some View{
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            Button(action:{
                //perform action that will remove items from the wishlist
                //self.deleteItems
            }){
                Text("Remove")
                    .fontWeight(.medium)
                    .font(.caption)
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
}

