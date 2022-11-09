//
//  AddItemView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct AddItemView: View {
   var body: some View {
         NavigationView {
            VStack {
               Spacer()
            NavigationLink(destination: Manually_AddItem()) {
               Text("Add Items Manually")
                  .foregroundColor(Color.green)
               
            }
               Spacer()
            
            NavigationLink(destination: ReceiptScanView()) {
               Text("Scan Receipts")
                  .foregroundColor(Color.green)
               
            }
               Spacer()
            
         }
         
      }
   }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
