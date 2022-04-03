//
//  SettingModel.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/03/30.
//

import Foundation


struct SettingModel {
    var leftImageName: String = ""
    var menuTitle: String = ""
    // 없을수도 있는 값에 optional 설정
    var subTitle: String?
    var rightImageName: String?
}


// generalCell에서 사용할 구조체 생성
struct GeneralModel {
    var leftLable: String = ""
}
