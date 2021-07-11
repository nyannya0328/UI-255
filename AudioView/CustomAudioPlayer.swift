//
//  CustomAudioPlayer.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/08.
//

import SwiftUI
import AVKit

struct CustomAudioPlayer: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    
    
    var player : AVPlayer
    
    
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        
        let controller =  AVPlayerViewController()
        
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        
        controller.player = player
        
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayer), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        
        
        return controller
        
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
    
    class Coordinator : NSObject{
        
        
        var parent : CustomAudioPlayer
        
        init(parent : CustomAudioPlayer){
            
            self.parent = parent
        }
        
        
        @objc func restartPlayer(){
            
            
            
            parent.player.seek(to: .zero)
        }
        
        
    }
}

