import SwiftUI
import Factory

@main
struct YettelTestAppIOSApp: App {
    
    @InjectedObject(\.coordinator) private var coordinator: Coordinator
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(route: .highwayVignettes)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.build(route: route)
                    }
            }
            .tint(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
            .accentColor(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
        }
    }
}
