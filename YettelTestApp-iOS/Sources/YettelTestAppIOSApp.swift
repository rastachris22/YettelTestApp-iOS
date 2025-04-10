import SwiftUI
import Factory

@main
struct YettelTestAppIOSApp: App {
    
    @InjectedObject(\.coordinator) private var coordinator: Coordinator
    @InjectedObject(\.globalErrorManager) private var globalErrorManager: GlobalErrorManager
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(route: .highwayVignettes)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.build(route: route)
                    }
                    .alert(item: Binding(
                        get: { globalErrorManager.errorMessage.map { ErrorWrapper(message: $0) } },
                        set: { _ in globalErrorManager.clear() }
                    )) { wrapper in
                        Alert(
                            title: Text("Error"),
                            message: Text(wrapper.message),
                            dismissButton: .default(Text("OK")) {
                                globalErrorManager.clear()
                            }
                        )
                    }
            }
            .tint(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
            .accentColor(YettelTestAppIOSAsset.Assets.Color.Button.primary.swiftUIColor)
        }
    }
}
