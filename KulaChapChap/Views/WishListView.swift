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
                Section{
                    ForEach(wishlist.wishListItems){ item in
                        HStack(alignment: .top, spacing: 5){
                            Image(item.thumbnailImage)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            VStack{
                                Text(item.name)
                                Text("$\(item.price)")
                            }
                        }
                    }.onDelete(perform: deleteItems)
                }
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
