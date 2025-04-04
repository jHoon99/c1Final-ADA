//
//  MessageInputView.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var nickname: String
    @State private var message: String = ""
    @State private var goToNext: Bool = false

    private var isButtonEnabled: Bool {
        !message.isEmpty && message.count <= 40
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 0) {
                Text(nickname)
                    .foregroundColor(Color(hex: "6D2EF2"))
                    .font(.custom("SUIT-Bold", size: 23))
                Text("에게")
                    .foregroundColor(.black)
                    .font(.custom("SUIT-Bold", size: 23))
            }

            HStack {
                Text("무엇을 물어보고 싶나요?")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }

            Button(action: {}) {
                Text("[노션] \(nickname)의 러너 위키 보러가기")
                    .font(.custom("SUIT-Regular", size: 14))
                    .underline()
            }
            .foregroundColor(Color.gray)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    .frame(height: 160)

                TextEditor(text: $message)
                    .onChange(of: message) { newValue in
                        if newValue.count > 40 {
                            message = String(newValue.prefix(40))
                        }
                    }
                    .padding(12)
                    .frame(height: 160)
                    .background(Color.clear)
                    .overlay(
                        Group {
                            if message.isEmpty {
                                Text("가장 궁금한 걸 짧고 굵게 적어주세요")
                                    .font(.custom("SUIT-Regular", size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.top, 18)
                                    .padding(.leading, 18)
                            }
                        },
                        alignment: .topLeading
                    )
            }

            HStack {
                Spacer()
                Text("(\(message.count)/40)")
                    .foregroundColor(.gray)
                    .font(.custom("SUIT-Regular", size: 14))
                    .padding(.trailing)
            }
            

            Spacer()

            Button(action: {
                goToNext = true
            }) {
                Text("완료")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isButtonEnabled ? Color(hex: "6D2EF2") : Color.gray)
                    .cornerRadius(12)
            }
            .disabled(!isButtonEnabled)
            .padding(.bottom, 10)
            .sheet(isPresented: $goToNext) {
                CompletionView()
            }
        }
        .padding(.top, 40)
        .padding([.leading, .trailing, .bottom])
    }
}

#Preview {
    MessageInputView(nickname: .constant("Monica"))
}
