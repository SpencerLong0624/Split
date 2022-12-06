//
//  scanner.swift
//  test_apppp
//
//  Created by Muhammad Uzair Umar on 11/8/22.
//

//Step 1. Load a receipt image from Resource folder
import Vision
import UIKit


class Scanner: ObservableObject {
  var output : [String] = []
  
  func request(_ image: UIImage) {
    let recognizeTextRequest = VNRecognizeTextRequest  { (request, error) in
      guard let observations = request.results as? [VNRecognizedTextObservation] else {
        print("Error: \(error! as NSError)")
        return
      }
      for currentObservation in observations {
        let topCandidate = currentObservation.topCandidates(1)
        if let recognizedText = topCandidate.first {
          //OCR Results
          print(recognizedText.string)
          self.output.append(recognizedText.string)
        }
      }
    }
    recognizeTextRequest.recognitionLevel = .accurate
    
    guard let cgImage = image.cgImage else {
      return
    }
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    do {
      try handler.perform([recognizeTextRequest])
    } catch let error as NSError {
      print("Failed: \(error)")
    }
  }
  
  func getOutput(_ image: UIImage) -> [String] {
    request(image)
    print("here is output: ", self.output)
    return self.output
  }
}
