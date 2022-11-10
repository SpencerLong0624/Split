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
   
   func request(_ image: UIImage) -> String {
      
      var output : String = ""
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
               output = recognizedText.string
            }
         }
     
      }
      recognizeTextRequest.recognitionLevel = .accurate
      
      
      guard let cgImage = image.cgImage else {
         return ""
      }
      let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
      DispatchQueue.global(qos: .userInitiated).async {
         do {
            try handler.perform([recognizeTextRequest])
         }
         catch let error as NSError {
            print("Failed: \(error)")
         }
      }
      return output
   }
   

   
}
