//
//  ExplanationView.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import SwiftUI

struct ExplanationView: View {
    
    @State private var goToNext: Bool = false
    
    @Binding var enteredNickname: String
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Image("butterfly_icon")
                        .resizable()
                        .scaledToFit( )
                        .frame(width: 120, height: 100)
                    Spacer()
                }
                .padding(.top, 40)
                
                Text("러너")
                    .font(.custom("SUIT-Bold", size: 40))
                    .foregroundColor(Color(hex: "6D2EF2"))
                + Text("가 궁금해요!")
                    .font(.custom("SUIT-Bold", size: 40))
                
                Text("궁금한 러너를 선택하고,")
                    .font(.custom("SUIT-Regular", size: 14))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
                Text("마음을 담은 편지를 작성해보세요.")
                    .font(.custom("SUIT-Regular", size: 14))
                
                VStack {
                    Text("편지는 3월 28일 ")
                        .font(.custom("SUIT-Regular", size: 14))
                    + Text("금요일 밤 12시까지만 ")
                        .font(.custom("SUIT-Bold", size: 14))
                    + Text("쓸 수 있고,")
                        .font(.custom("SUIT-Regular", size: 14))
                    
                    Text("이후에는 추가 작성이 불가해요.")
                        .font(.custom("SUIT-Regular", size: 14))
                }
                .padding(.top, 10)
                
                VStack {
                    Text("작성하신 편지는 ")
                        .font(.custom("SUIT-Regular", size: 14))
                    + Text("토요일 오후 3시 이후에")
                        .font(.custom("SUIT-Bold", size: 14))
                    Text("편지의 주인공에게 전달됩니다.")
                        .font(.custom("SUIT-Regular", size: 14))
                }
                .padding(.top, 10)
                
                Spacer()
                
                    Button(action: {
                        goToNext = true
                    }) {
                        Text("편지 쓰러가기")
                            .font(.custom("SUIT-Regular", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "6D2EF2"))
                            .cornerRadius(14)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .sheet(isPresented: $goToNext) {
                    NicknameInputView(enteredNickname: enteredNickname)
                }
            }
        }
    }


#Preview {
    ExplanationView(enteredNickname: .constant(""))
}
