//
//  AddItemView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct AddItemView: View {
   var body: some View {
        VStack {
          Spacer()
            .frame(minHeight: 10, idealHeight: 100, maxHeight: 400)
            .fixedSize()
          Text("How do you want to enter items?")
            .font(.subheadline)
            .fontWeight(.bold)
          Spacer()
            .frame(minHeight: 10, idealHeight: 100, maxHeight: 600)
            .fixedSize()
        NavigationLink(destination: Manually_AddItem()) {
           Text("Add Items Manually")
              .foregroundColor(Color.green)
           
        }
           Spacer()
            .frame(minHeight: 10, idealHeight: 100, maxHeight: 600)
            .fixedSize()
        NavigationLink(destination: ReceiptScanView()) {
           Text("Scan Receipts")
              .foregroundColor(Color.green)
           
        }
          Spacer()
            .frame(minHeight: 10, idealHeight: 100, maxHeight: 600)
            .fixedSize()
     }
   }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
