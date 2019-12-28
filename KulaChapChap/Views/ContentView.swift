//
//  ContentView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-18.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView{
            List{
                ForEach(menu){section in
                    Section(header:
                        Text(section.name)
                            .font(.largeTitle)
                            .background(Color.purple.opacity(0.05))
                            .foregroundColor(.green)
                            .padding(5)
                            .cornerRadius(1.5)
                            .overlay(
                            Capsule(style: .continuous)
                                .stroke(Color.gray.opacity(0.95), lineWidth: 0.5)
                        )
                    ){
                        ForEach(section.items){item in
                            ItemsView(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
                
            .listStyle(GroupedListStyle())
        }
   }
}
