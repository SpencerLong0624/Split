//
//  ReceiptScanView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct ReceiptScanView: View {
  @ObservedObject var scanner = Scanner()
  @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
  @State private var selectedImage: UIImage?
  @State private var isImagePickerDisplay = false
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  var billTitle: String
  var billDescription: String
  var billDate: String
     
  var body: some View {
    VStack {
      if selectedImage != nil {
        Image(uiImage: selectedImage!)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(Rectangle())
        .frame(width: 300, height: 300)
      }
               
               
      Button("Choose from the galllery") {
        self.sourceType = .photoLibrary
        self.isImagePickerDisplay.toggle()
      }
      .padding()
      .foregroundColor(.white)
      .background(.red)
      .clipShape(Capsule())
              
      //This view call is not correct as of now. I am working on it
      if(selectedImage != nil) {
        NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: scanner.getBillItems(selectedImage!), addFriendViewModel: addFriendViewModel)) {
          Text("Submit Picture for Scan")
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(red: 76/255, green: 229/255, blue: 177/255))
        .clipShape(Capsule())
      }
    }
    .navigationBarTitle("Scan A Receipt")
    .sheet(isPresented: self.$isImagePickerDisplay) {
      ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
    }
  }
}
