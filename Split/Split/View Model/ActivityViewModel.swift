//
//  ActivityViewModel.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import Foundation
import Combine

class ActivityViewModel: ObservableObject {
  @Published var billViewModels: [BillViewModel] = []
  private var cancellables: Set<AnyCancellable> = []
  @Published var billRepository = BillRepository()
  @Published var activity: [Bill] = []
  @Published var filteredBillViewModels: [BillViewModel] = []
  
  init(email: String) {
    billRepository.$bills.map { bills in
      bills.filter{bill in return bill.bill_owers.contains(email) || bill.bill_payers.contains(email)}.map(BillViewModel.init)
    }
    .assign(to: \.billViewModels, on: self)
    .store(in: &cancellables)
  }
  
  func add(_ bill: Bill) {
    billRepository.add(bill)
    billViewModels.append(BillViewModel(bill: bill))
  }
  
  func search(searchText: String) {
    self.filteredBillViewModels = self.billViewModels.filter { billViewModel in
      return billViewModel.bill.title.lowercased().contains(searchText.lowercased())
    }
  }
  
  func filterUserAssociatedBills(email: String) {
    self.billViewModels = self.billViewModels.filter { billViewModel in
      return billViewModel.bill.bill_owers.contains(email) || billViewModel.bill.bill_payers.contains(email)
    }
  }
}
