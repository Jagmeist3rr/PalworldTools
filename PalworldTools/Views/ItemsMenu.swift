import SwiftUI

struct ItemsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @State private var selectedOption = "Defenses"
    @State private var tempoptions = ["Defenses", "Other", "All"]
    
    @State private var showButton = false // Flag to control button visibility
    @State private var selectedTab = 0 // Track selected tab index

    var body: some View {
        ZStack {
            Color(hex: "#8f8da6")
                .edgesIgnoringSafeArea(.all)
            VStack {
                if showButton {
                    HStack {
                        Button(action: {
                            // Dismiss the current view
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrowshape.turn.up.backward.2.fill")
                                .foregroundColor(.black)
                        }
                        .padding()
                        Spacer()
                        Text("Items")
                            .padding(.leading, 20)
                        Spacer()
                        Picker(selection: $selectedOption, label: Text("Select Option")) {
                            ForEach(tempoptions, id: \.self) {
                                Text($0)
                            }
                        }
                        //Button("Custom Button") {
                            // Perform action
                        //}
                        .foregroundColor(.black)
                        .padding()
                        //.frame(maxWidth: .infinity)
                        Spacer()
                    }
                    // Show the button only when defenseBuildingView is active
  
                }
                else {
                    HStack {
                        Button(action: {
                            // Dismiss the current view
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrowshape.turn.up.backward.2.fill")
                                .foregroundColor(.black)
                        }
                        .padding()
                        Spacer()
                        Text("Items")
                            .padding(.leading, 20)
                        Spacer()
                        
                        Spacer()
                    }
                }

                TabView(selection: $selectedTab) {
                    MaterialsView()
                        .tag(0)
                        .foregroundColor(.black)
                        .tabItem {
                            Image(systemName: "wrench.and.screwdriver.fill")
                            Text("Materials")
                        }
                        .foregroundColor(.blue)
                    defenseBuildingView(buildingManager: defenseBuildingsManager, selectedOption: $selectedOption)
                        .tag(1)
                        .tabItem {
                            Image(systemName: "building.2.crop.circle.fill")
                            Text("Buildings")
                        }
                        .foregroundColor(.blue)
                    WeaponsView()
                        .tag(2)
                        .tabItem {
                            Image(systemName: "button.roundedbottom.horizontal")
                            Text("Weapons")
                        }
                        .foregroundColor(.blue)
                }
                .tint(.black)
                .onChange(of: selectedTab) { tab in
                    // Check if the defense building tab is selected
                    showButton = (tab == 1)
                }
            }
        }
    }
}




struct Items_Previews: PreviewProvider {
    static var previews: some View {
        let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
        let otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager()) // Initialize otherBuildingsManager here

        return ItemsView()
            .environmentObject(defenseBuildingsManager)
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
            .environmentObject(otherBuildingsManager)

    }
}
