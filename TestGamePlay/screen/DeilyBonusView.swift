//
//  DeilyBonusView.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import SwiftUI

struct DeilyBonusView: View {
    
     var procet = 60
    @State var isPresentedGifDay = false
    @Binding var isCovplite: Bool
    

    
    var body: some View {
        ZStack {
            BlurUIView(style: .systemChromeMaterialDark)
                .opacity(0.9)
                .ignoresSafeArea()
            if !isPresentedGifDay {
                VStack {
                    VStack {
                        Text("[Weekly bonus]")
                        Text("[Come back everyday to collect your reward!]")
                    }.foregroundStyle(.white)
                    
                    CustonProgressBarView(procent: CGFloat(procet))
                    VStack {
                        HStack {
                            Button(action: {isPresentedGifDay.toggle()}, label: {
                                BonusCapsuleView(text1: "DAY 1", text2: "X5")
                            })
                            BonusCapsuleView(text1: "DAY 2", text2: "X5").opacity(0.6)
                            BonusCapsuleView(text1: "DAY 3", text2: "X10").opacity(0.6)
                        }
                        HStack {
                            BonusCapsuleView(text1: "DAY 4", text2: "X10").opacity(0.6)
                            BonusCapsuleView(text1: "DAY 5", text2: "X15").opacity(0.6)
                            BonusCapsuleView(text1: "DAY 6", text2: "X15").opacity(0.6)
                        }
                    }
                    
                }.animation(.spring, value: procet)
            } else {
                VStack(spacing: 20) {
                    Text("DAY 1").font(.largeTitle).bold()
                    Text("[CONGRATS!]").font(.largeTitle).bold()
                    Image(systemName: "gift.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                    BonusCapsuleView(text2: "X5").foregroundStyle(.black)
                    Button("Get gif") {
                        isPresentedGifDay.toggle()
                        isCovplite = false
                
                    }.buttonStyle(.borderedProminent)
                }
                .foregroundStyle(.white)
                
            }
           
        }.animation(.spring, value: isPresentedGifDay)
                
        
            
        
    }
}

#Preview {
    DeilyBonusView(isCovplite: .constant(false))
}

struct BonusCapsuleView: View {
    @State var text1 = ""
    @State var text2 = ""
    var body: some View {
        ZStack{
            Capsule()
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
            VStack {
                Text(text1)
                    .font(.system(size: 15))
                    .bold()
                
                Image("GoldTicket")
                    .resizable()
                    .frame(width: 60, height: 40)
                    .rotationEffect(.degrees(-20))
                Text(text2).offset(x: 18, y: -12)
            }.offset(y: 5)
        }
    }
}
