//
//  NewBillView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct NewBillView: View {
   @State private var title = ""
   @State private var description = ""
   @State private var date = Date()
   @State private var userFriends = []
   
   var body: some View {

      NavigationView {
         VStack{
//           NavigationLink
            Form{
              if userFriends.isEmpty {
                Section(header: Text("Friends")){
                   Text("No Friends added")
                }
              } else {
                Section(header: Text("Friends")){
                   Text("Friends")
                }
              }
            }
            Form {
               
               Section(header: Text("Expense Information")){
                  TextField("Enter a Title", text: $title)
                  TextField("Enter a description", text: $description)
                  DatePicker("Pick a date", selection: $date,displayedComponents: [.date])
                             .padding()
                  
                 NavigationLink(destination: AddItemView(billTitle: title, billDescription: description, billDate: date)) {
                     Text("Create Expense")
                        .foregroundColor(Color.green)
                     
                  }
                  
                   }
               }
            }
         .navigationBarTitle("Add an Expense")
         }
      .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
         
      }
               }
      
 

struct NewBillView_Previews: PreviewProvider {
    static var previews: some View {
        NewBillView()
    }
}
