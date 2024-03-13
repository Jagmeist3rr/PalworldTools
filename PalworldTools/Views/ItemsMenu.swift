import SwiftUI

struct ItemsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)

            }
            .navigationTitle("Items") // Add navigation title
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        NavigationLink("Building Structures", destination: defenseBuildingView())
                        NavigationLink("Materials", destination: MaterialsView())
                        Button("Home"){
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .foregroundColor(.black)
                    .padding() // Add padding as needed
                }
            }
        }
        .navigationBarHidden(true) // Hide default navigation bar
    }
}

struct Items_Previews: PreviewProvider {
    static var previews: some View {
        let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
        return ItemsView()
            .environmentObject(defenseBuildingsManager)
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
    }
}
