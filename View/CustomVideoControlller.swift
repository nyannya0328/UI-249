//
//  CustomVideoControlller.swift
//  UI-249
//
//  Created by nyannyan0328 on 2021/06/30.
//

import SwiftUI
import AVKit

struct CustomVideoControlller: UIViewControllerRepresentable {
    var player : AVPlayer
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.playBack), name: .AVPlayerItemDidPlayToEndTime, object: player.currentTime)
        
    
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
    
    class Coordinator : NSObject{
        var parent : CustomVideoControlller
        
        init(parent : CustomVideoControlller) {
            
            self.parent = parent
            
            
            
        }
        
        @objc func playBack(){
            
            
            parent.player.seek(to: .zero)
            
            
        }
        
        
    }
}


