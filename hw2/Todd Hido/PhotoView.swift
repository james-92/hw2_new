//
//  Todd_PhotoView.swift
//  hw2
//
//  Created by James.Lai on 25/10/2024.
//

import SwiftUI

struct PhotoView: View {
    let photographer: Photographer
    @State private var selectedPhoto: String? = nil // 用來存儲被選中的圖片名稱
    @State private var isPhotoVisible: Bool = false // 用來控制照片是否顯示

    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        ZStack {
            // 主要的照片网格视图
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(photographer.photoNames(), id: \.self) { photoName in
                            // 圖片按鈕，點擊後放大
                            Image(photoName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 2)
                                .cornerRadius(5)
                                .onTapGesture {
                                    selectedPhoto = photoName
                                    isPhotoVisible = true
                                }
                        }
                    }
                    .padding()
                }
            
            // 如果有選擇的照片，則顯示浮現圖像
            if isPhotoVisible, let selectedPhoto = selectedPhoto {
                ZStack {
                    Color.white.opacity(0.95)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isPhotoVisible = false // 點擊背景隱藏浮現圖像
                        }
                    
                    Image(selectedPhoto)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(20)
                        .cornerRadius(15)
                        .zIndex(1)
                }
                .transition(.opacity)
            }
        }
        .navigationTitle("\(photographer.name)'s Photos")
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        // 建立示例 Photographer
//        let samplePhotographer = Photographer(
//            name: "Todd Hido",
//            imageName: "Todd_Hido_face",
//            biography1: "Sample biography part 1.",
//            biography2: "Sample biography part 2.",
//            biophoto: "Todd_Hido_bio",
//            bioquote: "\"Sample quote.\"",
//            numberOfPhotos: 21, // 設定照片數量
//            numberOfBooks: 6
//        )
//        
//        // 為 PhotoView 提供預覽
//        PhotoView(photographer: samplePhotographer)
//    }
//}


