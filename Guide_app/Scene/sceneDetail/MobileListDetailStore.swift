//
//  sceneDetailStore.swift
//  Guide_app
//
//  Created by Z64me on 16/9/2562 BE.
//  Copyright (c) 2562 Z64me. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
/*

 The sceneDetailStore class implements the sceneDetailStoreProtocol.

 The source for the data could be a database, cache, or a web service.

 You may remove these comments from the file.

 */

class MobileListDetailStore: MobileListDetailStoreProtocol {

  
  
  func getImageMobile(_ completion: @escaping (Result<ImagePhone, ApiError>) -> Void) {

    
    let todoEndpoint: String = "https://scb-test-mobile.herokuapp.com/api/mobiles/1/images/"
    AF.request(todoEndpoint)
      .responseJSON { response in
        switch response.result{
        case .success(let value):
          let array = JSON(value)
          var images: ImagePhone = []
          
          for json in array.arrayValue {
            let decoder = JSONDecoder()
            if let image = try? decoder.decode(ImageMobile.self, from: json.rawData()) {
              images.append(image)
            }
          }
          completion(.success(images))
          
        case .failure(let error):
          print(error)
          completion(Result.failure(ApiError.jsonError))
        }
    }
    
    
  
}
  
  
  
  
  
  
  
  
}
