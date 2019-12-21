//
//  AppMainView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-21.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct AppMainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            myOrders()
            .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Orders")
            }
        }
    }
}
