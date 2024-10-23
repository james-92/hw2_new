//
//  ContentView.swift
//  hw2
//
//  Created by James.Lai on 23/10/2024.
//

import SwiftUI

struct Book {
    let title: String          // 書籍標題
    let description: String     // 書籍描述
    let coverImage: String      // 封面圖片名稱
    let inpages: [String]         // 內頁圖片名稱的陣列
}

struct Photographer: Identifiable {//定義攝影師型別
    let id = UUID()         // 唯一識別符
    let name: String        // 攝影師名字
    let imageName: String   // 頭貼
    let biography1: String   //攝影師生平介紹1
    let biography2: String   //攝影師生平介紹2
    let biophoto: String     //攝影師bio照片
    let bioquote: String     //攝影師quote
    let numberOfPhotos: Int  //可以設定photo 頁面有多少張照片
    
    func photoNames() -> [String] { //使用numberOfPhotosu變數來自動生成照片的陣列，格式為：“name_number"
        return (1...numberOfPhotos).map { "\(name.replacingOccurrences(of: " ", with: ""))_\($0)" }
    }
    let books: [Book] //定義書籍
}

struct ContentView: View {
    let photographers = [
        Photographer(name: "Todd Hido",
                     imageName: "Todd_Hido_face",
                     biography1: "美國攝影師 Todd Hido，1968 年生於俄亥俄州肯特市，畢業於波士頓藝術博物館學院與加州藝術學院，現居住於舊金山灣區。他於九〇年代開始從事攝影創作，2001 年所出版的第一部作品《House Hunting》順利成為其生涯著名的代表作之一，十多年下來共出版了超過十部書籍。他的作品在被許多美術館永久收藏，如惠特尼美術館、古根漢美術館、舊金山現代美術館等等。",
                     biography2: "Todd Hido 善於描繪美國地景，記錄下空無一人的各地城市與郊區住宅，之間時常夾雜著女性肖像作品，將故事賦予更多的情緒。他所創作的影像彷彿就是我們生活中的偶然一瞥，但在他的刻意安排下，呈現出一種難以揣測與惶惶不安的視覺張力。透過陰鬱的氣候，將觀者的情緒帶往回憶的漩渦，水霧瀰漫的空氣夾雜著孤寂，煢煢冷調的畫面更讓內心瞬間蒙上陰霾。然而，畫面中偶然出現的微弱光線，瞬間指引著迷失的內心，所鋪展出的複雜記憶挑起了敏銳的情緒，喚起每個人對於潛意識裡的微光印記。",
                     biophoto:"Todd_Hido_bio",
                     bioquote: "\"When you've had a bad experience, you sometimes feel compelled to recreate it in a way that allows you to control it.\"",
                     numberOfPhotos: 21,
                     books: [
                             Book(
                                 title: "House Hunting",
                                 description: "Published in 2001, House Hunting is, on the one hand, a portrait of a certain America at that specific moment in history: this is an economically downtrodden place, dark and empty homes with the dirty laundry barely packed, or homes with the lights on but radiating no warmth. Simultaneously, this is a portrait of America — and specifically, suburban America — from any contemporary post-war decade: a raw look at white paint chipping off of picket fences.",
                                 coverImage: "ToddHido_book1_0",  // 封面
                                 inpages: ["ToddHido_book1_1", "ToddHido_book1_2", "ToddHido_book1_3", "ToddHido_book1_4"]  // 內頁
                             ),
                             Book(
                                 title: "Outskirts",
                                 description: "The scale of House Hunting, 17x13 inches (43x35 cm), initially gave the artist pause when proposed by the publisher. ‘I wasn’t sure about it. I didn’t want the book to end up crooked or shoved in someone’s bookshelf.’ Instead, the scale of the book demands a confrontation with its 26 carefully selected photographs, edited by Hido himself, a practice he insists on with each of his books. In so deliberately paring down the contents of House Hunting, Hido establishes how critical each photograph is in meaning and function. The physical experience of the photographs reinforces the emotional. In 2002, therefore, Outskirts was published as the companion book to House Hunting with the same size, shape, and page count.",
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
                     ),
        
        Photographer(name: "Robert Frank",
                     imageName: "Robert_Frank_face",
                     biography1: "紀實攝影師 Robert Frank（羅伯・法蘭克）1924 年出生於瑞士，1947 年移民至紐約。最著名的作品為 1958 年所出版的《美國人》，以局外人的觀點銳利卻細微地解剖美國社會，更因此被譽為 20 世紀最具影響力的攝影書。",
                     biography2:"Robert Frank 同時也是一位紀錄片導演，在完成了《美國人》一系列作品，成為眾人矚目的攝影師之關鍵時刻，於 1950 年代末期後的十年間他選擇放棄攝影，改為沉浸在動態影像的創作上。作品包含備受好評的處女作〈Pull My Daisy〉、長片〈Me and My Brother〉與〈One Hour〉⋯⋯等數十部，其中一些更是 1950 和 1960 年代新美國電影的經典。1970 年代，Robert Frank 重新回歸靜態攝影，並發表了他的第二本攝影書《The Lines of My Hand》，這本書被定義為攝影師自身的「影像式自傳」，反映了生活的節奏，定義了另一種表達自我的視覺語言。2015 年，Robert Frank 啟動著他的回顧展計畫，「Robert Frank: Books and Films, 1947–2014」將在 30 個國家與 50 個城市展出，目前已於德國、奧地利、美國、瑞士與日本等地舉辦過展覽。",
                     biophoto:"Robert_Frank_bio",
                     bioquote: "There is one thing the photograph must contain, the humanity of the moment.",
                     numberOfPhotos: 12,
                     books: [
                        Book(
                            title: "The Americans",
                            description: "瑞士出生的美國攝影師 Robert Frank（羅伯・法蘭克）其經典攝影集《The Americans（美國人）》，1958 年由法國出版社首次出版，隨後次年於美國面世。這本書重新定義了攝影書的本質，也改變了二十世紀攝影的發展。甚至有許多文章與書籍深入談論《美國人》一書，就可知曉此書帶給世界的衝擊並非是單純的美學面，更甚地影響至政治、文化與教育。",
                            coverImage: "RobertFrank_book1_0",  // 封面
                            inpages: ["RobertFrank_book1_1", "RobertFrank_book1_2", "RobertFrank_book1_3", "RobertFrank_book1_4"]  // 內頁
                        ),
                        Book(
                            title: "Pangnirtung",
                            description: "In August 1992 Robert Frank's good friend Reginald Rankin invited Frank on a trip to Pangnirtung, a village of around 1,300 Inuit inhabitants in the Arctic Circle. This book is Frank's documentation of the five-day sojourn. Curiously Frank depicts Pangnirtung void of its people: the still harbour, public housing, a convenience store, a telephone post. Sincere without being sentimental, the photos are shaped by a short text from Frank himself, \"Prefabricated homes along the main road in Pangnirtung. At times a decorated window - reflections inside or outside. Stones - maybe the balance of a big sky above…\"",
                            coverImage: "RobertFrank_book2_0",  // 封面
                            inpages: ["RobertFrank_book2_1", "RobertFrank_book2_2", "RobertFrank_book2_3", "RobertFrank_book2_4"]  // 內頁
                        ),
                        Book(
                            title: "Life Dances On",
                            description: "I think of myself, standing in a world that is never standing still,” the artist Robert Frank once wrote. “I’m still in there fighting, alive because I believe in what I’m trying to do now.” Life Dances On: Robert Frank in Dialogue—the artist’s first solo exhibition at MoMA—provides a new perspective on his expansive body of work by exploring the six vibrant decades of Frank’s career following the 1958 publication of his landmark photobook, The Americans.",
                            coverImage: "RobertFrank_book3_0",  // 封面
                            inpages: ["RobertFrank_book3_1", "RobertFrank_book3_2", "RobertFrank_book3_3", "RobertFrank_book3_4"]  // 內頁
                        ),
                         ]
                     ),
        Photographer(name: "Chen Jiagang",
                     imageName: "Chen_Jiagang_face",
                     biography1: "陳家剛的攝影手法來源於他對環境的洞悉力，無論是在影像世界裡呈現出的中國工業，或者是位於工廠﹑礦山或乾旱的風景，他獨有的風格足以讓觀眾一眼認出他的手筆。無論是彩色或黑白照片，陳家剛可以捕捉到不同環境中的層次和深度。以他從事建築業的背景和與生俱來的審美能力，陳家剛通過攝影來鼓勵觀眾去欣賞生活中逐漸即逝的美景。",
                     biography2: "陳家剛的作品主要以家鄉的廢棄工廠為題材。在這些宏偉的工業廢墟當中，他也納入了穿旗袍的女子。女子隱喻著嫵媚和神秘感，與現實中凋零的場景聯繫在一起，象徵著藝術家對中國歷史浪漫的幻滅，同時代表了對未來的信念和希望的矛盾感。他的作品描繪當今中國社會的複雜性，也記錄了中國在快速發展的步伐下，對工業、城市、環境和女性的影響。",
                     biophoto:"Chen_Jiagang_bio",
                     bioquote: "",
                     numberOfPhotos: 21,
                     books: [
                        Book(
                            title: "The Great Third Front",
                            description: "Chen Jiagang 陈家刚 (born in 1962 in Chongqing) was first trained as an architect and founded the Chengdu Upriver Museum and Kunming Upriver Museum. He began his photography career around 2003 with his series Third Front – followed by The Great Third Front in 2008 -, which primarily tackle vanishing collective histories by creating intriguing pictures in large-format of obsolete military cities constructed during the 1960s (called the ‘Third Line’). Here, the past-idealised vision of Chinese industrial grandeur is transformed into an anxious inquiry into lost memories and the uncertain future of these leftover zones. He lives and works in Beijing. ",
                            coverImage: "ChenJiagang_book1_0",  // 封面
                            inpages: ["ChenJiagang_book1_1", "ChenJiagang_book1_2", "ChenJiagang_book1_3", "ChenJiagang_book1_4"]  // 內頁
                        )
                         ]
                     ),
        Photographer(name: "Harry Gruyaert",
                     imageName: "Harry_Gruyaert_face",
                     biography1: "Harry Gruyaert 是探索彩色攝影的歐洲先鋒攝影師之一，自 1969 年以來，他前後拍攝了摩洛哥、印度、埃及、日本、美國、愛爾蘭與家鄉比利時，獨具一格的表現方式產生猶如電影般的色彩風格。正當美國的彩色攝影先驅 William Eggleston 與 Stephen Shore 已經擁抱了彩色底片這個新媒材，並為其創造出更多嶄新可能性的同時；歐洲同一世代的攝影師們仍保有著「彩色攝影不是藝術」的思想，認為顏色不過就是譁眾取寵的代名詞而已。在當時，歐洲仍然以傳統的人文思想當道；然而美國同一時期，不只攝影，藝術界更是蓬勃地發展中。在 1968 年 Harry Gruyaert 首次造訪美國，從未映入眼簾的流行藝術對他造成前所未有的衝擊。",
                     biography2: "比利時攝影師 Harry Gruyaert，1941 年出生於安特衛普，於布魯塞爾學習電影與攝影，其後曾在電視台底下製作了幾部短片。受到美國蓬勃的流行藝術興起與電影的影響，他的作品為攝影帶來全新的表現方法，更界定了攝影的新領域：一種感性、非敘事的獨到表現方式，利用色彩的對比與光影的明暗，輪廓分明地重新定義這個世界。",
                     biophoto:"Harry_Gruyaert_bio",
                     bioquote: "I wouldn't know how to live without photography. I don't know what my life would be like without photography, a black hole probably.",
                     numberOfPhotos: 21,
                     books: [
                        Book(
                            title: "Harry Gruyaert",
                            description: "面對美國的前衛與歐洲的保守，在此對比下他重新思考了何謂「平庸」。黑白攝影所展現的往往是以人為主體的思想，世俗常態並非他們所追求。Harry Gruyaert 的一幅著名彩色作品，捕捉的對象就是巴黎路邊的平凡桌椅，這作品受到馬格蘭攝影師 Raymond Depardon 大為讚賞，因為此影像的迷人之處在於其透露著何謂凡庸，同時描繪出真實的巴黎，且無人能與之媲美，因為拿黑白底片的攝影師終其一生不會將鏡頭對準平凡無奇的桌子。",
                            coverImage: "HarryGruyaert_book1_0",  // 封面
                            inpages: ["HarryGruyaert_book1_1", "HarryGruyaert_book1_2", "HarryGruyaert_book1_3", "HarryGruyaert_book1_4"]  // 內頁
                        ),
                        Book(
                            title: "India",
                            description: "「印度可謂一片混亂：那兒總令你失去防備、迷失方向。印度也會刺激你開始動腦思索。當地總有一股能量源自持續不斷的混亂狀態，好比人民、一座座城市和喧鬧忙碌的群眾。那兒有催生著影像的無數種元素，和你不得不出手自制，以免不慎讓作品流於俗套的繽紛色彩。這是讓我立刻為之著迷的原因。」── Harry Gruyaert。過去四十年來，四處遊歷的比利時攝影師 Harry Gruyaert 樂此不疲地縱橫在印度次大陸上，並透過《India》見證了一座傳統與現代性兼具，歡騰活力與寧靜時刻恆常共存且張力十足的國度。書中的大部分影像都是前所未見的作品，由繁複細節和豐富層次交織而成，並游移在鮮明彩色與幾近黑白的色調間；空氣中瀰漫著色彩、光線和喧囂，但偶爾也會沉入靜謐。在本書中，Harry Gruyaert 分享多年來面對這座神秘國度時透過多重感官體驗的一切，從而揮灑出一冊特色鮮明、不僅止於描繪異國情調的作品。",
                            coverImage: "HarryGruyaert_book2_0",  // 封面
                            inpages: ["HarryGruyaert_book2_1", "HarryGruyaert_book2_2", "HarryGruyaert_book2_3", "HarryGruyaert_book2_4"]  // 內頁
                        )
                         ]
                     )
    ]

    
    var body: some View {
        NavigationStack {
            List(photographers) { photographer in
                NavigationLink(destination: PhotographerDetailView(photographer: photographer)) {
                    HStack(spacing: 15) {
                        Image(photographer.imageName)  // 從 Assets 中載入圖片
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70) // 設定頭像大小
                            .clipShape(Circle()) // 圖片裁剪成圓形
                            .shadow(radius: 5)   // 加陰影效果
                        
                        Text(photographer.name) // 顯示名字
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("newColor")) // 根據主題調整顏色
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Photographers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

