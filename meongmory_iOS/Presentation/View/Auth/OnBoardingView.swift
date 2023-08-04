//
//  OnBoardingView.swift
//  meongmory_iOS
//
//  Created by 김초원 on 2023/08/04.
//

import SwiftUI
import iPages

struct OnBoardingContent {
    let emoji: String
    let title: String
    let content: String
    let optionContent: String?
    let tipContent: String?
    let imageName: String?
}

struct OnBoardingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var currentPage: Int = 0

    let onBoardingContents: [OnBoardingContent] = [
        OnBoardingContent(emoji: "📝",
                          title: "반려동물의 일상을 기록해보세요!",
                          content: "귀여운 반려동물을 사진과 동영상으로 추억하고,\n반려동물이 변화하는 모습을 간직할 수 있습니다! ",
                          optionContent: "올린 사진 및 영상은 평생 저장되므로 걱정 마세요!",
                          tipContent: nil,
                          imageName: nil),
        OnBoardingContent(emoji: "🏠",
                          title: "가족 및 지인들에게\n반려동물의 일상을 공유해보세요!",
                          content: "펫 다이어리는 내가 초대한 가족 및 지인에게만\n나의 반려동물 일상을 프라이빗하게 보여줄 수 있어요!\n또한 가족 및 지인들이 나의 반려동물의\n사진을 다운받을 수 있어요!",
                          optionContent: nil,
                          tipContent: "일반 버전은 최대 6명, Pro 버전은 최대 8명까지 초대 가능해요!",
                          imageName: "onboard2"),
        OnBoardingContent(emoji: "📙",
                          title: "펫 다이어리",
                          content: "자! 이제부터 펫 다이어리를 통해 나의 반려동물의 귀여웠던 순간, 사고쳤던 일 등 다양한 일상을 기록하세요!",
                          optionContent: nil,
                          tipContent: nil,
                          imageName: "onboard3"),
    ]

    var body: some View {
        VStack(alignment: .center) {
            
            getMainContentsView()
            
            Spacer()
            bottomButton
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)

        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                }
            }
        }
    }
    
    func getMainContentsView() -> some View {
        var mainContentsView: some View {
            iPages(selection: $currentPage, content: {
                getContentView(content: onBoardingContents[0])
                getContentView(content: onBoardingContents[1])
                getContentView(content: onBoardingContents[2])
            })
            .dotsTintColors(currentPage: Color(red: 141/255, green: 93/255, blue: 25/255),
                             otherPages: Color(red: 141/255, green: 93/255, blue: 25/255, opacity: 0.2))
            .padding(.bottom, 50)
        }
        return mainContentsView
    }
    
    func getContentView(content: OnBoardingContent) -> some View {
        var attributedStr: AttributedString {
            var attributedStr = AttributedString("Pro 버전")
            attributedStr.font =  .system(size: 13, weight: .semibold)
            attributedStr.foregroundColor = Color(red: 252/255, green: 156/255, blue: 19/255)
            return attributedStr
        }
        
        var contentView: some View {
            VStack(alignment: .center) {
                Text(content.emoji)
                    .font(Font.system(size: 35))
                    .padding(.bottom, 20)
                
                Text(content.title)
                    .font(Font.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                    .lineSpacing(2)
                    .multilineTextAlignment(.center)
                
                Text(content.content)
                    .font(Font.system(size: 14))
                    .fontWeight(.medium)
                    .lineSpacing(2)
                    .multilineTextAlignment(.center)
                
                if content.optionContent != nil {
                    Text(content.optionContent!)
                        .font(Font.system(size: 14))
                        .fontWeight(.medium)
                        .lineSpacing(3)
                        .padding(.top, 1)
                        .multilineTextAlignment(.center)
                }
                
                if content.tipContent != nil {
                    Text(content.tipContent!)
                        .font(Font.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
                        .padding(.top, 5)
                }
                
                if content.imageName != nil {
                    Image(content.imageName!)
                        .padding(.top, 30)
                        .padding(.bottom, 50)
                } else {
                    /// 1번째 온보딩 화면의 하단 이미지 포함 컨텐츠 렌더링
                    VStack {
                        HStack {
                            VStack(alignment: .leading, content: {
                                Text("사진")
                                    .font(Font.system(size: 20))
                                    .fontWeight(.medium)
                                    .padding(.bottom, 10)
                                Text("일반 회원과 Pro 회원")
                                    .font(Font.system(size: 13))
                                Text("모두 무제한으로 올릴 수 있어요!")
                                    .font(Font.system(size: 13))
                                    
                            })
                            .padding(.leading, 35)
                            
                            Spacer()
                            Image("onboard1")
                                .padding(.trailing, 20)
                        }
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .trailing, content: {
                            Text("Video")
                                .font(Font.system(size: 20))
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .padding(.trailing, 5)
                            Text("동영상 길이는 최대 1분까지 등록 가능해요!")
                                .font(Font.system(size: 13))
                            Text(attributedStr + "을 결제하시면 최대 5분까지 등록 가능해요!")
                                .font(Font.system(size: 13))
                        })
                    }
                    .padding(.top, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 60)
                }
            }
        }
        return contentView
    }
    
    
    
    var bottomButton: some View {
        Button {
            if currentPage < 2 { currentPage += 1 }
            else {
                // TODO: 홈으로 이동
            }
        } label: {
            Text("다음")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(red: 60/255, green: 39/255, blue: 10/255))
        .cornerRadius(10)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
