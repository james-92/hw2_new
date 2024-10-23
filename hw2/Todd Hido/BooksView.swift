//
//  Todd_PhotoBookView.swift
//  hw2
//
//  Created by James.Lai on 25/10/2024.
//

import SwiftUI

struct BooksView: View {
    let photographer: Photographer
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .bottom) {  // 设置封面之间的间距
                            // 获取每本书的封面照片
                            ForEach(photographer.books, id: \.coverImage) { book in
                                VStack(spacing: 0){
                                    // 顯示封面圖片
                                    Image(book.coverImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150)  // 設定封面圖片的大小
                                        .onTapGesture {
                                            // 点击封面图片时滚动到对应的书籍描述区域
                                            withAnimation {
                                                proxy.scrollTo(book.title, anchor: .top)
                                            }
                                        }
                                    
                                    // 顯示書籍標題
                                    Text(book.title)
                                        .font(.caption)
                                        .italic()
                                        .multilineTextAlignment(.center)
                                    
                                    // 顯示書籍描述
    //                                Text(book.description)
    //                                    .font(.subheadline)
    //                                    .foregroundColor(.gray)
    //                                    .multilineTextAlignment(.center)
    //                                    .padding(.top, 2)
    //                                    .padding(.horizontal, 10)
                                }
                                .frame(width: 180)  // 設定每本書的顯示寬度
                            }
                        }
                        .padding()
                    }
                    ForEach(photographer.books, id: \.title) { book in
                        VStack(alignment: .leading, spacing: 0){
                            Text(book.title)
                                .font(.title)
                                .italic()
                                .bold()
                                .padding(.leading,2)
                            Image(book.coverImage)
                                .resizable()
                                .scaledToFit()
                            Text(book.description)
                                .font(.caption)
                            TabView {
                                // 遍历 book.inpages 中的图片
                                ForEach(book.inpages, id: \.self) { page in
                                    Image(page)  // 每个页面的图片
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .frame(height:250)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            
                        }
                        .padding()
                    }
                }
            }
        }
    }
}



struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        // 建立示例 Photographer
        let samplePhotographer = Photographer(
            name: "Todd Hido",
            imageName: "Todd_Hido_face",
            biography1: "Sample biography part 1.",
            biography2: "Sample biography part 2.",
            biophoto: "Todd_Hido_bio",
            bioquote: "\"Sample quote.\"",
            numberOfPhotos: 21,// 設定照片數量
            books: [
                    Book(
                        title: "House Hunting",
                        description: "Published in 2001, House Hunting is, on the one hand, a portrait of a certain America at that specific moment in history: this is an economically downtrodden place, dark and empty homes with the dirty laundry barely packed, or homes with the lights on but radiating no warmth. Simultaneously, this is a portrait of America — and specifically, suburban America — from any contemporary post-war decade: a raw look at white paint chipping off of picket fences.",
                        coverImage: "ToddHido_book1_0",  // 封面
                        inpages: ["ToddHido_book1_1", "ToddHido_book1_2", "ToddHido_book1_3", "ToddHido_book1_4"]  // 內頁
                    ),
                    Book(
                        title: "Outskirts",
                        description: "PThe scale of House Hunting, 17x13 inches (43x35 cm), initially gave the artist pause when proposed by the publisher. ‘I wasn’t sure about it. I didn’t want the book to end up crooked or shoved in someone’s bookshelf.’ Instead, the scale of the book demands a confrontation with its 26 carefully selected photographs, edited by Hido himself, a practice he insists on with each of his books. In so deliberately paring down the contents of House Hunting, Hido establishes how critical each photograph is in meaning and function. The physical experience of the photographs reinforces the emotional. In 2002, therefore, Outskirts was published as the companion book to House Hunting with the same size, shape, and page count.",
                        coverImage: "ToddHido_book2_0",
                        inpages: ["ToddHido_book2_1", "ToddHido_book2_2", "ToddHido_book2_3", "ToddHido_book2_4"]
                    ),
                    Book(
                        title: "Roaming",
                        description: "For one thing, he didn’t want to be seen as a ‘a one trick pony.’ After the critical and general success of House Hunting and Outskirts, Todd Hido wanted to create a book that had no homes in it. He also made a concerted effort to shoot primarily in the daytime. In that way, Roaming, which is a book of landscape photographs taken over ten years and published in 2004, demonstrates a purposeful shift in Hido’s work. Roaming is a physical move out of the driveway and onto the open road, once the sun has risen.",
                        coverImage: "ToddHido_book3_0",
                        inpages: ["ToddHido_book3_1", "ToddHido_book3_2", "ToddHido_book3_3", "ToddHido_book3_4"]
                    ),
                    Book(
                        title: "Between the Two",
                        description: "Until the publication of Between the Two, in 2007, Todd Hido had not published or exhibited his portrait work, though he worked on it consistently. Portraits are the primary drive of this book, which maintains its introversion, even when allowing for direct encounters and eye-contact with people, whose existence is only implied in previous books.",
                        coverImage: "ToddHido_book4_0",
                        inpages: ["ToddHido_book4_1", "ToddHido_book4_2", "ToddHido_book4_3", "ToddHido_book4_4"]
                    ),
                    Book(
                        title: "A Road Divided",
                        description: "Todd Hido says that A Road Divided, published in 2010, ‘snuck up’ on him. ‘I had been photographing landscapes for a couple of years, but had no intention of making anything of them … I had no other purpose of making them other than responding to the beauty that I saw.’ The result is this book, which Hido thinks of as a ‘more mature’ collection of landscapes, propelled by the obsessive need to create, and untethered from the need to ‘prove’ anything, such as ‘I’m not just that guy who photographs houses at night,’ he laughs.",
                        coverImage: "ToddHido_book5_0",
                        inpages: ["ToddHido_book5_1", "ToddHido_book5_2", "ToddHido_book5_3", "ToddHido_book5_4"]
                    ),
                    Book(
                        title: "Excerpts from Silver Meadows",
                        description: "Todd Hido considers Excerpts from Silver Meadows, published in 2013, the ‘culmination’ of everything he had put into his books prior to this point. And it came together at the ‘perfect moment,’ he says. At a point when he kept hearing that the future of publication would be ‘e-books’, and when photography was widely understood as a form of rapid and feathery documentation (‘selfies’), Hido wanted to create a book that ‘could only be a physical, tangible experience.’",
                        coverImage: "ToddHido_book6_0",
                        inpages: ["ToddHido_book6_1", "ToddHido_book6_2", "ToddHido_book6_3", "ToddHido_book6_4"]
                    )
                ]
        )
        
        // 為 PhotoView 提供預覽
        BooksView(photographer: samplePhotographer)
    }
}
