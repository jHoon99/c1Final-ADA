//
//  OnboardingView.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var goToNext = false
    
    @State private var enteredNickname: String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    Image("butterfly_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 53)
                    Spacer()
                }
                .padding(.leading, 20)
                HStack {
                    Text("C")
                        .foregroundColor(Color(hex: "6D2EF2"))
                        .font(.custom("SUIT-Bold", size: 48))
                    + Text("urious")
                        .font(.custom("SUIT-Bold", size: 48))
                    Spacer()
                }
                .multilineTextAlignment(.center)
                .padding(.leading, 30)
                HStack {
                    Text("B")
                        .foregroundColor(Color(hex: "6D2EF2"))
                        .font(.custom("SUIT-Bold", size: 48))
                    + Text("utterfly")
                        .font(.custom("SUIT-Bold", size: 48))
                    Spacer()
                }
                .multilineTextAlignment(.center)
                .padding(.leading, 30)
                HStack {
                    Text("L")
                        .foregroundColor(Color(hex: "6D2EF2"))
                        .font(.custom("SUIT-Bold", size: 48))
                    + Text("etter")
                        .font(.custom("SUIT-Bold", size: 48))
                    Spacer()
                }
                .multilineTextAlignment(.center)
                .padding(.leading, 30)
                
                HStack {
                    Text("CBL: 러너가 궁금해요!")
                        .font(.custom("SUIT-Regular", size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 0.1)
                    Spacer()
                    
                }
                .padding(.leading, 30)
                
                HStack {
                    Text("혹시 궁금한 러너가 있나요?\n어쩌면 혼자만의 궁금증이 아닐지도 몰라요.")
                        .font(.custom("SUIT-Regular", size: 14))
                        .foregroundColor(.black)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius:5)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 30)
                
                HStack {
                    Spacer()
                    
                    Text("궁금한 러너에게 질문을 남기면\n이번주 토요일,\n우리의 호기심 많은 나비가\n레터를 모아 전달해 드립니다.")
                        .font(.custom("SUIT-Regular", size: 14))
                        .foregroundColor(.black)
                        .padding(20)
                        .background(Color(hex:"E8e8fc"))
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .multilineTextAlignment(.trailing)
                    
                    
                }
                .padding(.top, 20)
                .padding(.trailing, 25)
                
                Spacer()
                
                Button(action: {
                    goToNext = true
                    
                    
                }) {
                    Text("시작하기")
                        .font(.custom("SUIT-Regular", size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "6D2EF2"))
                        .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .sheet(isPresented: $goToNext) {
                    ExplanationView(enteredNickname: $enteredNickname)
                }
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    OnboardingView()
}
