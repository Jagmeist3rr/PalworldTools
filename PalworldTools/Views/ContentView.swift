import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    NavigationLink("Lifunk Capture Rates", destination: EffigyTool())
                    NavigationLink("Pal Skills",destination: PalSkills())
                    NavigationLink("Items", destination: ItemsView())
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
