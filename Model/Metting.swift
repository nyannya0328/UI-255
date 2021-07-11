//
//  Metting.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/07.
//

import SwiftUI

struct Metting: Identifiable {
    var id = UUID().uuidString
    var title : String
    var timing : Date
    var cardColor : Color = Color("Blue")
    var turnedOn : Bool = true
    var memberTyplist = "Public"
    var members : [String] = Array(repeating: "", count: 10)
}


