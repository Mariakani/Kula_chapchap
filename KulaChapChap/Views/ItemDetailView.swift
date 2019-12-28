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
    let item: MenuItem
    var body: some View {
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
                .padding()
            Button(action: {
                self.order.add(item:self.item)
            }){
                Text("Order now")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(Color.green, lineWidth: 1)
                )
            }
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        
    }
}
