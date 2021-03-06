//
//  CheckoutView.swift
//  KulaChapChap
//
//  Created by Mariak Achuoth on 2019-12-24.
//  Copyright © 2019 Mariak Achuoth. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "GiftCard"]
    static let tipPercentages = [25,15, 10, 5, 0]
    @State  private var paymentType = 0
    @State private var tipAmount = 0
    @State private var showAlert = false
    
    var totalPrice: Double{
        let  total  = Double(order.total)
        let tipvalue = total/100 * Double(CheckoutView.self.tipPercentages[tipAmount])
        return total + tipvalue
    }

    var body: some View {
        Form{
            Spacer()
            Section{
                Text("Enter tips 😊😊")
                    .font(.headline)
                Picker("percentages ", selection: $tipAmount){
                    ForEach(0..<CheckoutView.self.tipPercentages.count){
                        Text("\(CheckoutView.self.tipPercentages[$0]) %")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.green)
            }
            Section{
                Text("Choose method of  payment")
                    .font(.headline)
                
                Picker("", selection: $paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(CheckoutView.self.paymentTypes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.green)
            Spacer(minLength: 20)
           Spacer()
                Section(header: Text("Your total is: $\(totalPrice, specifier: "%.2f")")){
            Button(action: {
                self.showAlert.toggle()
                       }){
                           Text("Checkout")
                           .fontWeight(.bold)
                           .font(.headline)
                           .foregroundColor(.white)
                           .padding(5)
                           .background(Color.green)
                        .cornerRadius(10)
                           .overlay(
                               Capsule(style: .continuous)
                                .stroke(Color.green, lineWidth: 1)
                           )
                       }
            }
                .font(.largeTitle)
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showAlert){
                Alert(title: Text("✅"), message: Text("Order successfully checkout, Your total amount was $: \(totalPrice, specifier: "%.2f") - Thanks you for your loyalty to Kula na Watu ltd "), dismissButton: .default((Text("Ok")), action: {
                    self.order.items.removeAll()
                    NavigationLink(destination: ContentView()){
                        Text("Return to main page")
                    }
                }) )
            
            }
       
    }
}
}
