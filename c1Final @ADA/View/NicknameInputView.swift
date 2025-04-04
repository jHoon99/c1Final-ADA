//
//  NicknameInputView.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import SwiftUI

struct NicknameInputView: View {
    @State private var nickname: String = ""
    @State private var goToNext = false
    @State private var showAlert = false
    
    var enteredNickname: String
    
    var body: some View {
        NavigationView {
            VStack {

                // 닉네임 텍스트
                HStack {
                    VStack {
                        Text("당신의 닉네임을")
                            .font(.custom("SUIT-Bold", size: 24))
                            .foregroundColor(.black)
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("알려주세요!")
                            .font(.custom("SUIT-Bold", size: 24))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                
                    
                VStack {
                    Text("닉네임은 영문으로 작성해주세요")
                        .font(.custom("SUIT-Regular", size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("ex) Yoshi")
                        .font(.custom("SUIT-Regular", size: 14))
                        .foregroundColor(.gray)
                        .padding(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 20)
                
                // 닉네임 입력 텍스트 필드
                TextField("NickName", text: $nickname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .font(.custom("SUIT-Regular", size: 18))
                    .foregroundColor(.black)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // "다음" 버튼
                Button(action: {
                    // 닉네임 유효성 검사 후 다음 화면으로 이동
                    if Runner.runnerNicknames.contains(nickname.lowercased()) {
                        goToNext = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("다음")
                        .font(.custom("SUIT-Regular", size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "6D2EF2"))
                        .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("닉네임과 일치하는 러너가 없어요."), message: Text("다시 입력해주세요."))
                }
                .sheet(isPresented: $goToNext) {
                    RunnerSelectionView(enteredNickname: $nickname)
                }
            }
            .padding(.top, 40)
        }
    }
}

struct NicknameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameInputView(enteredNickname: "Kadan")
    }
}
