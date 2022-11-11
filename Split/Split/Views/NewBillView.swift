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
   
   var body: some View {

      NavigationView {
         VStack{
            Form{
               
               Section(header: Text("Friends")){
                  Text("No Friends added")
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
         
      }
               }
      
 

struct NewBillView_Previews: PreviewProvider {
    static var previews: some View {
        NewBillView()
    }
}
