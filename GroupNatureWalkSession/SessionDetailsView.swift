import SwiftUI

struct SessionDetailsView: View {
    let session: NatureWalkSession
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        
        ZStack {
            Color.gray.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    TabView {
                        ForEach(session.photos, id: \.self) { photoURL in
                            AsyncImage(url: URL(string: photoURL)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 280)
                                        .clipped()
                                default:
                                    Image(systemName: "photo.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 280, height: 280)
                                }
                            }
                        }
                    }
                    .frame(height: 280)
                    .tabViewStyle(PageTabViewStyle())
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(session.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Host: \(session.hostName)")
                            Spacer()
                            Text("$\(String(format: "%.2f", session.pricePerPerson)) / person")
                        }
                        .font(.subheadline)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", session.starRating))
                        }
                        
                        Text(session.description)
                            .padding(.top, 5)
                        
                        Button(action: callHost) {
                            Label("Contact: \(session.phoneNumber)", systemImage: "phone")
                        }
                        .font(.subheadline)
                        .padding(.top, 5)
                    }
                    //.padding()
                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    HStack {
                        Button(action: {
                            favoritesManager.toggleFavorite(session: session)
                        }) {
                            Image(systemName: favoritesManager.isFavorite(session: session) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }// favorite button

                        
                        Spacer()
                        
                        ShareLink(item: "\(session.name) - $\(String(format: "%.2f", session.pricePerPerson)) per person") {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                    }
                    .padding()
                }
            }
            
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .scrollContentBackground(.hidden)
            
            .navigationTitle(session.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        }
    
    func callHost() {
        let phoneNumber = session.phoneNumber.replacingOccurrences(of: " ", with: "")
        if let url = URL(string: "tel://\(phoneNumber)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}


//struct SessionDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            SessionDetailsView(session: NatureWalkSession(
//                name: "Forest Adventure",
//                description: "Explore the lush forest trails and discover hidden wonders of nature.",
//                starRating: 4.5,
//                hostName: "Green Trails Co.",
//                phoneNumber: "123-456-7890",
//                photos: ["forest1", "forest2"],
//                pricePerPerson: 25.0
//            ))
//        }
//    }
//}
