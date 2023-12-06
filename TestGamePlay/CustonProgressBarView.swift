//
//  CustonProgressBarView.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import SwiftUI

struct CustonProgressBarView: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var procent: CGFloat = 60
    var color = Color(.green)
    
    var body: some View {
        let multiplayer = width / 100
        HStack {
                Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .offset(x: 10)
                .foregroundStyle(Color("ColorApp"))
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height, style: .continuous)
                    .frame(width: width, height: height)
                .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: height, style: .continuous)
                    .frame(width: procent * multiplayer, height: height)
                    .foregroundColor(color)
                   // .padding(2)
                Text("1/7")
                    .padding(width / 2 - 35)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    
            }
            
            .offset(y: 30)
            Image(systemName: "gift.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .offset(x: -10)
            .foregroundStyle(Color("ColorApp"))
        }
    }
}

#Preview {
    CustonProgressBarView()
}
