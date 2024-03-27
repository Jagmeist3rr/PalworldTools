import SwiftUI

struct ContentView: View {
    @StateObject var palsManager = PalsManager(palsManager: [])
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
    }
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6").edgesIgnoringSafeArea(.all)
                VStack {
                    TabView() {
                        PalsList()
                            .tag(0)
                            .foregroundColor(.black)
                            .tabItem {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                Text("Pals")
                            }
                        SkillView()
                            .tabItem {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                Text("Skills")
                            }
                        MiscView()
                            .tag(2)
                            .tabItem {
                                Image(systemName: "button.roundedbottom.horizontal")
                                Text("Misc")
                            }
                    }
                    .onAppear {
                        // Apply appearance customization when the ContentView appears
                        UITabBar.appearance().barTintColor = UIColor(red: 143/255, green: 141/255, blue: 166/255, alpha: 0.0)
                        UITabBar.appearance().unselectedItemTintColor = UIColor.black
                    }
  
                }
                .foregroundColor(.black)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .environmentObject(palsManager) // Inject PalsManager here

    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
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
