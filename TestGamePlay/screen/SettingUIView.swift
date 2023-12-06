//
//  SettingUIView.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import SwiftUI

struct SettingUIView: View {
    
    let screenSize = UIScreen.main.bounds
    @Binding var isCovplite: Bool
    @State private var dinamicImage = "volume.2.fill"
    @State private var musicImage = "music.quarternote.3"
    
    var body: some View {
        ZStack {
            BlurUIView(style: .systemChromeMaterialDark)
                .opacity(0.9)
                .ignoresSafeArea()
           
            VStack(spacing: 20) {
                Text("[SETTINGS]")
                    .font(.title)
                HStack(spacing: 40){
                    Button(action: {
                        SoundManager.shared.music.toggle()
                        musicImage = SoundManager.shared.music ? "music.quarternote.3" : "play.slash.fill"
                    }, label: {
                        Image(systemName: musicImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                    })
                    Button(action: {
                        SoundManager.shared.soundEffect.toggle()
                        dinamicImage = SoundManager.shared.soundEffect ? "volume.2.fill" : "volume.slash.fill"
                        
                    }, label: {
                        Image(systemName: dinamicImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                    })
                }.foregroundStyle(.black)
                Button("SAVE") {
                    isCovplite = false
                }.foregroundStyle(.black)
            }
                .frame(width: screenSize.width * 0.65, height: screenSize.height * 0.3)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
        }
    }
}

#Preview {
    SettingUIView(isCovplite: .constant(true))
}
