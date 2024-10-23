import SwiftUI

struct BiographyView: View {
    let photographer: Photographer // 接收 Photographer 實例
    
    var body: some View {
            ScrollView{
                VStack {
                    Text(photographer.name)
                        .font(.title)
                        .bold()
                    Image(photographer.biophoto)
                        .resizable()
                        .scaledToFill()
                    Text(photographer.bioquote)
                        .fontWeight(.light)
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,40)
                    Text(photographer.biography1) // 顯示攝影師的自介
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text(photographer.biography2) // 顯示攝影師的自介
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .navigationTitle(photographer.name) // 將導航標題設為攝影師的名字
            }
            .scrollIndicators(.hidden)
        }
}

//struct BiographyView_Previews: PreviewProvider {
//    static var previews: some View {
//        let samplePhotographer = Photographer(name: "Todd Hido", imageName: "Todd_Hido_face", biography1: "美國攝影師 Todd Hido，1968 年生於俄亥俄州肯特市，畢業於波士頓藝術博物館學院與加州藝術學院，現居住於舊金山灣區。他於九〇年代開始從事攝影創作，2001 年所出版的第一部作品《House Hunting》順利成為其生涯著名的代表作之一，十多年下來共出版了超過十部書籍。他的作品在被許多美術館永久收藏，如惠特尼美術館、古根漢美術館、舊金山現代美術館等等。",
//            biography2: "Todd Hido 善於描繪美國地景，記錄下空無一人的各地城市與郊區住宅，之間時常夾雜著女性肖像作品，將故事賦予更多的情緒。他所創作的影像彷彿就是我們生活中的偶然一瞥，但在他的刻意安排下，呈現出一種難以揣測與惶惶不安的視覺張力。透過陰鬱的氣候，將觀者的情緒帶往回憶的漩渦，水霧瀰漫的空氣夾雜著孤寂，煢煢冷調的畫面更讓內心瞬間蒙上陰霾。然而，畫面中偶然出現的微弱光線，瞬間指引著迷失的內心，所鋪展出的複雜記憶挑起了敏銳的情緒，喚起每個人對於潛意識裡的微光印記。",
//            biophoto:"Todd_Hido_bio",
//            bioquote: "\"When you've had a bad experience, you sometimes feel compelled to recreate it in a way that allows you to control it.\"") // 創建一個樣本攝影師
//        BiographyView(photographer: samplePhotographer) // 使用樣本攝影師進行預覽
//    }
//}
