//
//  RunnerSelectionView.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import SwiftUI

struct RunnerSelectionView: View {
    
    @State private var searchText: String = ""
    @State private var selectedRunner: String? = nil
    @Binding var enteredNickname: String
    @State private var showNextScreen = false
    
    let allNicknames = Runner.allNicknames
    @State private var isScrolled: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("뭐가 다른거죠?")
                        .font(.custom("SUIT-Bold", size: 20))
                    Text(enteredNickname)
                        .font(.custom("SUIT-Bold", size: 24))
                        .foregroundColor(.purple)
                    + Text(" 👋")
                        .font(.custom("SUIT-Bold", size: 24))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack {
                    Text("어떤 러너가 궁금해요?")
                        .font(.custom("SUIT-Regular", size: 18))
                        .foregroundColor(.black)
                        .padding(.top, 1)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, 5)
                
                HStack {
                    Button(action: {
                        if let url = URL(string: "https://www.notion.so/posacademy/1b42b843d5af8197b7dbdffb2cfb72b8?v=1b42b843d5af812face1000c1de04873") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("[노션] 러너 위키 보러 가기")
                            .font(.custom("SUIT-Regular", size: 18))
                            .foregroundColor(.gray)
                            .underline()
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                
                TextField("러너 이름을 검색하세요", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.fixed(150)),
                        GridItem(.fixed(150))
                    ], spacing: 20) {
                        ForEach(Runner.allNicknames.filter { searchText.isEmpty || $0.lowercased().contains(searchText.lowercased()) }, id: \.self) { nickname in
                                Text(nickname)
                                    .font(.custom("SUIT-Regular", size: 16))
                                    .padding(20)
                                    .frame(width: 150)
                                    .background(selectedRunner == nickname ? Color.purple.opacity(0.2) : Color.white)
                                    .cornerRadius(30)
                                    .shadow(radius: 5)
                                    .padding(.horizontal, 20)
                                    .onTapGesture {
                                        selectedRunner = nickname
                                        enteredNickname = nickname
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                    .animation(.easeInOut(duration: 0.3), value: searchText)  // Smooth animation for the scroll
                
                Button(action: {
                    showNextScreen = true
                }) {
                    Text("다음")
                        .font(.custom("SUIT-Bold", size: 30))
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedRunner != nil ? Color.purple : Color.gray)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .disabled(selectedRunner == nil)
                .sheet(isPresented: $showNextScreen) {
                    MessageInputView(nickname: $enteredNickname)
                }
            }
            .padding(.top, 90)
        }
    }
}

struct RunnerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RunnerSelectionView(enteredNickname: .constant("Kadan"))
    }
}
