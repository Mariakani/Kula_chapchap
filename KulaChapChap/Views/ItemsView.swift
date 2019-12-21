//
//  ItemsView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-18.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    static let colors: [String: Color] = ["D" :.purple, "G":.black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    var body: some View{
        
        NavigationLink(destination: ItemDetailView(item: item)){
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading, spacing: 10){
                    Text(item.name)
                        .font(.headline)
                    Text("$ \(item.price)")
                }
                Spacer()
                ForEach(item.restrictions,  id: \.self){ restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        
                        .background(ItemsView.self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                }
            }
        }
       
    }
}
