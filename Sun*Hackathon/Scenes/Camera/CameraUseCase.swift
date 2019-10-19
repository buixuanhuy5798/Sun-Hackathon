//
//  CameraUseCase.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

protocol CameraUseCaseType {
    func detectImage(image: UIImage) -> Observable<[TypeTrash]>
    func convertToText(trashType: [TypeTrash]) -> String
}

struct CameraUseCase: CameraUseCaseType {
    
    let detectRepo: DetectTrashRepositoryType
    
    func detectImage(image: UIImage) -> Observable<[TypeTrash]> {
        return detectRepo.detectTrash(image: image)
    }
    
    func convertToText(trashType: [TypeTrash]) -> String {
        let max = trashType.sorted(by: { $0.score > $1.score })[0]
        if max.score > 0.9 {
            return "Đây là rác: " + max.getNameVi()
        } else if max.score < 0.9 && max.score >= 0.5 {
            return "Đây có thể là rác: " + max.getNameVi()
        } else {
            return "Chưa thể xác định được. Vui lòng thử lại"
        }
        
    }
}
