//
//  GameLevelView.swift
//  TestGamePlay
//
//  Created by Роман on 06.12.2023.
//

import SwiftUI

struct GameLevelView: View {
    
    //MARK: - Property
    @State private var currentLevel = CurrentLevel.one
    @State private var color1 = "ColorApp"
    @State private var color2 = "ColorApp"
    @State private var color3 = "ColorApp"
    @State private var color4 = "ColorApp"
    @State private var color5 = "ColorApp"
    @State private var color6 = "ColorApp"
    @State private var color7 = "ColorApp"
    @Environment(\.dismiss) var dismiss
    
    enum CurrentLevel {
        case one, two, three, four, five, six, seven
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let height = geometry.size.height
                let wight = geometry.size.width
                
                //MARK: - Levels Map
                Image("gameLevel").resizable()
        
                LevelLabelView(text: "7", color: $color7)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.43, y: height * 0.139)
                LevelLabelView(text: "6", color: $color6)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.22, y: height * 0.28)
                LevelLabelView(text: "5", color: $color5)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.43, y: height * 0.45)
                LevelLabelView(text: "4", color: $color4)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.19, y: height * 0.59)
                LevelLabelView(text: "3", color: $color3)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.68, y: height * 0.64)
                LevelLabelView(text: "2", color: $color2)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.58, y: height * 0.845)
                LevelLabelView(text: "1", color: $color1)
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.11, y: height * 0.845)
                
                //MARK: - Houme Button
                Button {
                    dismiss()
                    SoundManager.shared.playSound()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: wight * 0.11, height: height * 0.06)
                            .foregroundStyle(Color.white)
                            .shadow(color: .gray.opacity(0.5), radius: 5)
                        Image(systemName: "house.fill")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                    }
                } .offset(x: wight * 0.83, y: height * 0.91)
                
                //MARK: - NextLevel buttom
                Button("Next Level") {
                    chooseLevel()
                }.buttonStyle(.borderedProminent)
            }
            
            
            .navigationBarBackButtonHidden(true)
        }
    }
    
    //MARK: - ChooseLevel funtion
    func chooseLevel() {
        switch currentLevel {
        case .one:
            color1 = "Colorbuttom"
            color2 = "ColorApp"
            color3 = "ColorApp"
            color4 = "ColorApp"
            color5 = "ColorApp"
            color6 = "ColorApp"
            color7 = "ColorApp"
            currentLevel = CurrentLevel.two
        case .two:
            color2 = "Colorbuttom"
            currentLevel = CurrentLevel.three
        case .three:
            color3 = "Colorbuttom"
            currentLevel = CurrentLevel.four
        case .four:
            color4 = "Colorbuttom"
            currentLevel = CurrentLevel.five
        case .five:
            color5 = "Colorbuttom"
            currentLevel = CurrentLevel.six
        case .six:
            color6 = "Colorbuttom"
            currentLevel = CurrentLevel.seven
        case .seven:
            color7 = "Colorbuttom"
            currentLevel = CurrentLevel.one
        }
    }
}

//MARK: - Preview
#Preview {
    GameLevelView()
}

struct LevelLabelView: View {
    @State var text = "1"
    @Binding var color: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color(color))
            Text(text)
                .foregroundStyle(.black)
                .font(.largeTitle)
                .bold()
        }
    }
}
