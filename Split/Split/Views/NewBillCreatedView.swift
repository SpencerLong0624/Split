//
//  NewBillCreatedView.swift
//  Split
//
//  Created by Anthony A Lees on 12/7/22.
//

import SwiftUI

struct NewBillCreatedView: View {
  var body: some View {
    VStack {
      Text("Bill has been created and finalized. Do you want to create a new bill?")
        .font(.title3)
        .multilineTextAlignment(.center)

      
      NavigationLink(destination: NewBillView().navigationBarBackButtonHidden(true)) {
        Text("Create New Bill")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color(red: 76/255, green: 229/255, blue: 177/255))
      .clipShape(Capsule())
    }
    .navigationBarTitle("Bill Finalized")
    .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity
        )
    .background(Color(.systemGroupedBackground))
  }
}
