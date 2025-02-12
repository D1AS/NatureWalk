import SwiftUI

struct SessionsListView: View {
    @EnvironmentObject var sessionStore: NatureWalkSessions
     var username: String

    var body: some View {

        ZStack {
            Color.gray.opacity(0.6).edgesIgnoringSafeArea(.all)
            List(sessionStore.sessions) { session in
                
                NavigationLink {
                    SessionDetailsView(session: session)
                } label: {
                    SessionRowView(session: session)
                }

                .listRowBackground(Color.clear)
                
            }
            
            //            .listStyle(PlainListStyle())
            //                    .background(
            //                        Image("nature7")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fill)
            //                            .edgesIgnoringSafeArea(.all)
            //                    )
            
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .scrollContentBackground(.hidden)
            
            .navigationTitle("Nature Walk Sessions")
        }
    }
        
}

//struct SessionsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionsListView()
//    }
//}


struct SessionRowView: View {
    let session: NatureWalkSession
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: session.photos[0] )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(session.name)
                    .font(.headline)
                Text("$\(String(format: "%.2f", session.pricePerPerson)) / person")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
