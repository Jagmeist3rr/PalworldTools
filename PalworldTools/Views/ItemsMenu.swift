import SwiftUI

struct ItemsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())

    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    // Dismiss the current view
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back") // Text for the back button
                        .foregroundColor(.black) // Customize button text color
                }
            .padding()
                Text("Items")

            } // Add padding to the button
            
            TabView{
                MaterialsView().tabItem { Text("Materials") }
                    .foregroundColor(.blue)
                defenseBuildingView(buildingManager: defenseBuildingsManager).tabItem { Text("Test") }
                    .foregroundColor(.blue)
                WeaponsView().tabItem { Text("Weapons") }
                    .foregroundColor(.blue)

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
