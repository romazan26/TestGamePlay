//
//  GameLevelView.swift
//  TestGamePlay
//
//  Created by Роман on 06.12.2023.
//

import SwiftUI

struct GameLevelView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let height = geometry.size.height
                let wight = geometry.size.width
                
                Image("gameLevel").resizable()
                
//                LevelLabelView(text: "7", x: Int(wight * 0.43), y: Int(height * 0.139))
//                    .frame(width: wight * 0.2,height: height * 0.1)
//                LevelLabelView(text: "6", x: Int(wight * 0.22), y: Int(height * 0.28))
//                    .frame(width: wight * 0.2,height: height * 0.1)
//                LevelLabelView(text: "5", x: Int(wight * 0.43), y: Int(height * 0.45))
//                    .frame(width: wight * 0.2,height: height * 0.1)
//                LevelLabelView(text: "4", x: Int(wight * 0.19), y: Int(height * 0.59))
//                    .frame(width: wight * 0.2,height: height * 0.1)
//                LevelLabelView(text: "3", x: Int(wight * 0.68), y: Int(height * 0.64))
//                    .frame(width: wight * 0.2,height: height * 0.1)
//                LevelLabelView(text: "2", x: Int(wight * 0.58), y: Int(height * 0.845))
//                    .frame(width: wight * 0.2,height: height * 0.1)
                LevelLabelView(text: "1")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.11, y: height * 0.845)
                
                    .onAppear(perform: {
                        print(geometry.size)
                    })
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    GameLevelView()
}

struct LevelLabelView: View {
    @State var text = "1"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.green)
            Text(text)
                .foregroundStyle(.black)
                .font(.largeTitle)
                .bold()
        }
    }
}
