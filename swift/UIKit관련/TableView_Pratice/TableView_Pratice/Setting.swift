//
//  Setting.swift
//  TableView_Pratice
//
//  Created by 김동현 on 2023/06/05.
//

struct Setting {
    let settingIcon: String
    let settingLabel: String
    
}

extension Setting {
    static func dummy() -> [[Setting]] {
        return [[Setting(settingIcon: "✈️",
                        settingLabel: "에어플레인 모드"),
                Setting(settingIcon: "📡",
                        settingLabel: "와이파이"),
                Setting(settingIcon: "🐳",
                        settingLabel: "블루투스"),
                Setting(settingIcon: "😊",
                        settingLabel: "셀룰러"),
                Setting(settingIcon: "🍉",
                        settingLabel: "개인용 핫스팟")],
                [Setting(settingIcon: "🚨",
                        settingLabel: "알림"),
                Setting(settingIcon: "📢",
                        settingLabel: "사운드 및 햅틱"),
                Setting(settingIcon: "🎧",
                        settingLabel: "집중 모드"),
                Setting(settingIcon: "📺",
                        settingLabel: "스크린 타임")]]
    }
}
