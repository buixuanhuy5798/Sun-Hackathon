//
//  ProfileUseCase.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

struct Infomation {
    var name: String
    var phoneNumber: String
    var adress: String
    var point: String
}

extension Infomation {
    init() {
        self.init(name: "Hoàng Xuân Cường",
                  phoneNumber: "0987654321",
                  adress: "Ngõ 173 Trung Kính",
                  point: "57")
    }
}

protocol ProfileUseCaseType {
    func getInfomationProfile() -> Observable<[String]>
}

struct ProfileUseCase: ProfileUseCaseType {
    let fakeInfo = Infomation()
    func getInfomationProfile() -> Observable<[String]> {
        return Observable.create({ observable -> Disposable in
            observable.onNext([self.fakeInfo.name, self.fakeInfo.adress, self.fakeInfo.point, self.fakeInfo.phoneNumber])
            observable.onCompleted()
            return Disposables.create {
                observable.onCompleted()
            }
        })
    }
}
