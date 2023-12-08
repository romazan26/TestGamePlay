//
//  ShopUIView.swift
//  TestGamePlay
//
//  Created by Роман on 07.12.2023.
//

import SwiftUI

struct ShopUIView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader(content: { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            VStack{
                HStack {
                    CustomButtonView(action: {
                        dismiss()
                    }, textImage: "house.fill")
                    Spacer()
                    Text("[Shop]")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }.padding()
                List {
                    Section {
                        BoxSectionView(name: "[Epic chest]", price: "1.99$", ticket: "x500")
                        BoxSectionView(name: "[Lucky chest]", price: "4.99$", ticket: "x1200")
                    } header: {
                        Text("Tickets").font(.title2).bold().foregroundStyle(.black)
                            .offset(x: screenWidth * 0.3)
                        
                    }
                    .listRowBackground(Color("ColorApp"))
                    
                    Section {
                        SkinSectionView(name: "Character 1")
                        SkinSectionView(name: "Character 2", price: "1000", skinName: "dog.fill")
                    } header: {
                        Text("Skins").font(.title2).bold().foregroundStyle(.black)
                            .offset(x: screenWidth * 0.3)
                    }
                    .listRowBackground(Color("ColorApp"))
                    
                    Section {
                        SkinSectionView(name: "Location 1", price: "500", skinName: "cloud.snow.fill")
                        SkinSectionView(name: "Location 2", price: "600", skinName: "cloud.bolt.fill")
                        SkinSectionView(name: "Location 3", price: "700", skinName: "cloud.sun.fill")
                    } header: {
                        Text("Lacations").font(.title2).bold().foregroundStyle(.black)
                            .offset(x: screenWidth * 0.3)
                    }
                    .listRowBackground(Color("ColorApp"))
                }
            }
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShopUIView()
}

struct BoxSectionView: View {
    @State var name = ""
    @State var price = ""
    @State var ticket = ""
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: 100)
                Image(systemName: "cube.box.fill")
                    .resizable()
                    .frame(width: 60, height: 70)
                    .foregroundStyle(.black)
                Image("GoldTicket")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .offset(x: 20, y: 40)
                Text(ticket)
                    .offset(x: 55, y: 40)
            }
            Spacer()
            VStack {
                Text(name)
                    .font(.title2)
                
                Spacer()
                Button(action: {}, label: {
                    Text(price)
                        .bold()
                        .foregroundStyle(.black)
                        .padding(10)
                        
                    
                }).frame(width: 120, height: 40)
                    .background(.orange)
                    .cornerRadius(15)
                    .padding()
            }
            
        }
    }
}

struct SkinSectionView: View {
    @State var name = ""
    @State var price = "500"
    @State var skinName = "figure.stand"
    @State private var bay = true
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: 100)
                Image(systemName: bay ? "lock" : skinName)
                    .resizable()
                    .frame(width: 50, height: 70)
                    .foregroundStyle(.black)
            }
            Spacer()
            VStack {
                Text(name)
                    .font(.title2)
                
                Spacer()
                Button(action: {bay.toggle()}, label: {
                    if bay {
                        HStack {
                            Image("GoldTicket")
                                .resizable()
                                .frame(width: 30, height: 20)
                            Text(price)
                                .bold()
                                .foregroundStyle(.black)
                        }
                        .frame(width: 120, height: 40)
                        .background(.orange)
                        .cornerRadius(15)
                    } else {
                        ZStack{
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.green)
                        }.frame(width: 120, height: 40)
                            .background(.orange)
                            .cornerRadius(15)
                    }
                    
                })
            }.padding()
        }
    }
}

