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
     
     var body: some View {
         NavigationView {
             VStack {
                
                 if selectedImage != nil {
                     Image(uiImage: selectedImage!)
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .clipShape(Rectangle())
                         .frame(width: 300, height: 300)
                 }
                 
                 Button("Take a Picture ") {
                     self.sourceType = .camera
                     self.isImagePickerDisplay.toggle()
                 }.padding()
                   .accentColor(.red)
                 
                 Button("Choose from the galllery") {
                     self.sourceType = .photoLibrary
                     self.isImagePickerDisplay.toggle()
                 }.padding()
                   .accentColor(.red)
                
                
                if(selectedImage != nil){
                   Button("Submit Picture for Scan"){
                      scanner.request(selectedImage!)
                   }
                   .accentColor(.green)
                }
               
            
                
             }
             .navigationBarTitle("Scan A Receipt")
             .sheet(isPresented: self.$isImagePickerDisplay) {
                 ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
             }
            
            
             
         }
     }
 }

struct ReceiptScanView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptScanView()
    }
}
