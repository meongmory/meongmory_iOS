//
//  RecommendedView.swift
//  meongmory_iOS
//
//  Created by 김나연 on 2023/08/14.
//

import SwiftUI

struct RecommendedView: View {
    var body: some View {
        VStack(spacing: 10) {
            getBox(title: "이번 달 가장 귀여운 강아지는 누구?", date: "June 6/1 ~ 6/30", subtext: "강아지 콘테스트 입장하기", imgName: "cute_puppy", backgroundColor: Color(red: 1, green: 0.98, blue: 0.92), strokeColor: Color(red: 0.99, green: 0.69, blue: 0.13).opacity(0.2))
            getBox(title: "주변에 이런 식료품점이 있어요!", subtext: "주변 식료품점 찾아보기", imgName: "market", backgroundColor: Color(red: 1, green: 0.95, blue: 0.95), strokeColor: Color(red: 0.98, green: 0.44, blue: 0.4).opacity(0.2))
            getBox(title: "오늘은 이런 애견카페 어때요?", subtext: "주변 카페 찾아보기", imgName: "cafe", backgroundColor: Color(red: 0.93, green: 0.96, blue: 1), strokeColor: Color(red: 0.38, green: 0.45, blue: 0.95).opacity(0.2))
            getBox(title: "이런 애견 미용실은 어떤가요!", subtext: "주변 미용실 찾아보기", imgName: "salon", backgroundColor: Color(red: 0.94, green: 0.97, blue: 1), strokeColor: Color(red: 0.18, green: 0.56, blue: 0.98).opacity(0.2))
        }
        .padding(.top, 5)
        .padding(.horizontal, 16)
        .padding(.bottom, 50)
    }
    
    func getBox(
        title: String,
        date: String? = nil,
        subtext: String,
        imgName: String,
        backgroundColor: Color,
        strokeColor: Color
    ) -> some View {
        var box: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .frame(height: 20)
                    .font(Font.custom("AppleSDGothicNeoB00", size: 11))
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .padding(.top, 10)
                
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .black.opacity(0.2), location: 0.00),
                                    Gradient.Stop(color: .black.opacity(0), location: 0.16),
                                    Gradient.Stop(color: .black.opacity(0), location: 0.70),
                                    Gradient.Stop(color: .black.opacity(0.15), location: 0.74),
                                    Gradient.Stop(color: .black.opacity(0.2), location: 0.99),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .background(
                            Image(imgName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                        .cornerRadius(5)
                    
                    VStack(alignment: .trailing) {
                        if date != nil {
                            Text(date!)
                                .frame(height: 20)
                                .font(Font.custom("AppleSDGothicNeoM00", size: 10))
                                .foregroundColor(.white)
                                .padding(.top, 10)
                                .padding(.trailing, 14)
                        }
                        Spacer()
                        Text(subtext)
                            .frame(height: 20)
                            .font(Font.custom("AppleSDGothicNeoM00", size: 10))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .padding(.trailing, 14)
                    }
                }
                .frame(height: 168)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .background(backgroundColor)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .inset(by: 1)
                    .stroke(strokeColor, lineWidth: 2)
            )
        }
        return box
    }
}

struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
