//
//  OnlinePhotosProvider.swift
//  DASample
//
//  Created by Daniel Avram on 25/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class OnlinePhotosProvider: PhotosProvider {
    private var fetchedImages = [UIImage]()
    func getImage(ofSize size: ImageSize, completion: @escaping (UIImage?) -> Void) {
        let photoSize = (size.width, size.height)
        Alamofire.request(Endpoint.photo(photoSize).value,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseImage { response in
                let image = response.result.value
                completion(image)
        }
    }
}
