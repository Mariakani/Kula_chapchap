//
//  ItemsView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-18.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    let item: MenuItem
    var body: some View{
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .center, spacing: 10){
                Text(item.name)
            }
            
            
        }
       
    }
}
