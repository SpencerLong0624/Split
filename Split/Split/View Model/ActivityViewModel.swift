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
  
  init() {
    billRepository.$bills.map { bills in
      bills.map(BillViewModel.init)
    }
    .assign(to: \.billViewModels, on: self)
    .store(in: &cancellables)
  }

  func add(_ bill: Bill) {
    billRepository.add(bill)
  }

  func search(searchText: String) {
    self.filteredBillViewModels = self.billViewModels.filter { billViewModel in
      return billViewModel.bill.title.lowercased().contains(searchText.lowercased())
    }
  }
}
