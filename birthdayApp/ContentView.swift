import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Ruhi", birthday: Date(timeIntervalSince1970: 36)),
        Friend(name: "Sophia", birthday: Date())
    ]
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker("Birthday", selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
}

