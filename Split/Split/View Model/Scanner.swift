//
//  scanner.swift
//  test_apppp
//
//  Created by Muhammad Uzair Umar on 11/8/22.
//

//Step 1. Load a receipt image from Resource folder
import Vision
import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Scanner: ObservableObject {
  
  func request(_ image: UIImage) -> [String] {
    var output : [String] = []
    let recognizeTextRequest = VNRecognizeTextRequest  { (request, error) in
      guard let observations = request.results as? [VNRecognizedTextObservation] else {
        print("Error: \(error! as NSError)")
        return
      }
      for currentObservation in observations {
        let topCandidate = currentObservation.topCandidates(1)
        if let recognizedText = topCandidate.first {
          //OCR Results
          output.append(recognizedText.string)
        }
      }
    }
    recognizeTextRequest.recognitionLevel = .accurate
    
    guard let cgImage = image.cgImage else {
      return []
    }
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    do {
      try handler.perform([recognizeTextRequest])
    } catch let error as NSError {
      print("Failed: \(error)")
    }
    return output
  }
  
  func getBillItems (_ image: UIImage) -> BillItems {
    let output : [String] = request(image)
    var start_item_names : Bool = false
    var start_item_prices : Bool = false
    var item_names : [String] = []
    var item_prices : [String] = []
    for item in output {
      if item.contains("Your Cashier Today was") {
        start_item_names = true
        continue
      }
      if item.contains("TAX") {
        start_item_names = false
        start_item_prices = true
        continue
      }
      if item.contains("BALANCE") {
        start_item_prices = false
        break
      }
      if start_item_names {
        item_names.append(item)
      }
      if start_item_prices {
        item_prices.append(item)
      }
    }

    let billItemsObject : BillItems = BillItems()
    var billItems: [BillItem] = []
    
    for i in 0...(item_names.count - 1) {
      let item_name : String = item_names[i]
      var item_price : String = "0.00"
      if i <= item_prices.count - 1 {
        if item_prices[i].count >= 6 {
          item_price = item_prices[i][0...5]
          if item_price[5] == " " {
            item_price = item_price[0...4]
          }
          if item_price[4] == " " {
            item_price = item_price[0...3]
          }
        }
      }
      billItems.append(BillItem(email: "", name: item_name, price: item_price, user_full_name: ""))
    }
    billItemsObject.bill_items = billItems
    return billItemsObject
  }
}
