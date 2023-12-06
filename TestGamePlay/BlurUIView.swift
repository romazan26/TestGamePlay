//
//  BlurUIView.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import SwiftUI

struct BlurUIView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect:UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
  
}
