//
//  DetectTrashRepository.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

import Foundation
import Alamofire


protocol DetectTrashRepositoryType {
    func detectTrash(image: UIImage) -> Observable<[TypeTrash]>
}

struct DetectTrashRepository: DetectTrashRepositoryType {
    func detectTrash(image: UIImage) -> Observable<[TypeTrash]> {
        return Observable.create { (observable) -> Disposable in
            if let data = image.jpegData(compressionQuality: 1) {
                Alamofire.upload(multipartFormData: { mul in
                    mul.append(data, withName: "myPhoto", fileName: "image.jpg", mimeType: "imgage/jpg")
                }, to: APIService.Url.detectUrl, encodingCompletion: { result in
                    switch result {
                    case .success(let upload, let _, let _):
                        upload.responseJSON { respone in
                            if let status = respone.response?.statusCode {
                                switch (status) {
                                case 200:
                                    if let result = respone.result.value as?  NSArray {
                                        let a = result.compactMap { result ->  TypeTrash? in
                                            guard let data = result as? [String: Any] else {
                                                return nil
                                            }
                                            return TypeTrash(JSON: data )
                                        }
                                        observable.onNext(a)
                                        observable.onCompleted()
                                    }
                                default:
                                break
                                }
                            }
                        }
                    case .failure(_):
                        break
                    }
                })
            }
            return Disposables.create {
                observable.onCompleted()
            }
        }
    }
}
