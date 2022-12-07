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
      Text("Bill Finalized")
      .font(.title)
      .padding([.top], 40)
    }
    NavigationLink(destination: NewBillView().navigationBarBackButtonHidden(true)) {
      Text("Create New Bill")
    }
    .padding()
    .foregroundColor(.white)
    .background(Color(red: 76/255, green: 229/255, blue: 177/255))
    .clipShape(Capsule())
  }
}

struct NewBillCreatedView_Previews: PreviewProvider {
    static var previews: some View {
        NewBillCreatedView()
    }
}
