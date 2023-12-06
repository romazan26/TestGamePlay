//
//  ContentView.swift
//  TestGamePlay
//
//  Created by Роман on 05.12.2023.
//

import SwiftUI

struct MenuView: View {
    private let scale = 1.5
    @State var ticket = 100
    @State var isPresentedGif = false
    @State var isPresentedSet = false
    private let size = UIScreen.main.bounds.size
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    //MARK: - Gold ticket
                    HStack {
                        Spacer()
                        Image("GoldTicket")
                            .resizable()
                        .frame(width: 54, height: 38)
                        Text("\(ticket)").font(.title2)
                    }
                    Spacer()
                    
                    //MARK: - GmaeLogo
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 107*scale, height: 107*scale)
                        .foregroundStyle(.gray).opacity(0.4)
                        Text("Game Logo №1")
                            .frame(width: 107*scale, height: 107*scale)
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                    //MARK: - Play Button
                    NavigationLink {
                        GameLevelView().onAppear(perform: {
                            SoundManager.shared.playSound()
                        })
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 86*scale, height: 27*scale)
                                .foregroundStyle(Color("Colorbuttom"))
                            Text("[PLAY]")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                    }
                    Spacer()
                    
                    //MARK: - Button group
                    HStack(spacing: 20) {
                        CustomButtonView(action: {
                            isPresentedSet.toggle()
                            SoundManager.shared.playSound()
                        }, textImage: "gearshape.fill")
                        CustomButtonView(action: {
                            isPresentedGif.toggle()
                            SoundManager.shared.playSound()
                        }, textImage: "gift.fill")
                        CustomButtonView(action: {
                            SoundManager.shared.playSound()
                        }, textImage: "cart.fill")
                    }
                    
                    Spacer()
                }
                .padding(30)
                DeilyBonusView( isCovplite: $isPresentedGif)
                    .offset(y: isPresentedGif  ? 0 : size.height)
                    .animation(.bouncy, value: isPresentedGif)
                SettingUIView(isCovplite: $isPresentedSet)
                    .offset(y: isPresentedSet ? 0 : size.height)
                    .animation(.bouncy, value: isPresentedSet)
                    
            }
        }
    }
}

#Preview {
    MenuView()
}

struct CustomButtonView: View {
    let action: () -> Void
    let textImage: String
    var body: some View {
        Button {action()
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                Image(systemName: textImage)
                    .resizable()
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
            }
        }
    }
}
