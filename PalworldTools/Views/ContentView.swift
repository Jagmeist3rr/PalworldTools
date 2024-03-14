import SwiftUI

struct ContentView: View {
    @StateObject var palsManager = PalsManager(palsManager: [])

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    TabView() {
                        PalsList(palsManager: PalsManager(palsManager: []))
                            .tag(0)
                            .foregroundColor(.black)
                            .tabItem {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                Text("Pals")
                            }
                            .foregroundColor(.blue)
                        PalSkills()
                            .tag(1)
                            .foregroundColor(.black)
                            .tabItem {
                                Image(systemName: "building.2.crop.circle.fill")
                                Text("Pall Skills")
                            }
                            .foregroundColor(.black)
                        NavigationLink("Items", destination: ItemsView())
                            .tag(2)
                            .tabItem {
                                Image(systemName: "button.roundedbottom.horizontal")
                                Text("Misc")
                            }
                            .foregroundColor(.black)
                    }
                }
                .foregroundColor(.black)
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Palworld Bible")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }

        }
        .environmentObject(palsManager) // Inject PalsManager here

    }
}

extension Color {
    init(hex: String) {
        // Remove '#' if present
        var formattedHex = hex
        if formattedHex.hasPrefix("#") {
            formattedHex = String(formattedHex.dropFirst())
        }
        
        // Convert hex string to integer
        var rgb: UInt64 = 0
        Scanner(string: formattedHex).scanHexInt64(&rgb)
        
        // Create Color object
        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}

struct ContentViewt_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
            .environmentObject(SkillsManager())
    }
}
