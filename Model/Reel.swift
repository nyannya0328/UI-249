//
//  Reel.swift
//  UI-249
//
//  Created by nyannyan0328 on 2021/06/30.
//

import SwiftUI
import AVKit

struct Reel: Identifiable {
    var id = UUID().uuidString
    var player : AVPlayer?
    var mediaFile : MediaFile
}

