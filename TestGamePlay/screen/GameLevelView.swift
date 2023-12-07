//
//  GameLevelView.swift
//  TestGamePlay
//
//  Created by Роман on 06.12.2023.
//

import SwiftUI

struct GameLevelView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let height = geometry.size.height
                let wight = geometry.size.width
                
                Image("gameLevel").resizable()
        
                LevelLabelView(text: "7")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.43, y: height * 0.139)
                LevelLabelView(text: "6")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.22, y: height * 0.28)
                LevelLabelView(text: "5")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.43, y: height * 0.45)
                LevelLabelView(text: "4")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.19, y: height * 0.59)
                LevelLabelView(text: "3")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.68, y: height * 0.64)
                LevelLabelView(text: "2")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.58, y: height * 0.845)
                LevelLabelView(text: "1")
                    .frame(width: wight * 0.2,height: height * 0.1)
                    .offset(x: wight * 0.11, y: height * 0.845)
                
                Button {
                    dismiss()
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
