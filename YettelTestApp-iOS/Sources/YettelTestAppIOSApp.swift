import SwiftUI
import Factory

@main
struct YettelTestAppIOSApp: App {
    
    @Injected(\.coordinator) private var coordinator: CoordinatorType
    @Injected(\.globalErrorManager) private var globalErrorManager: GlobalErrorManagerType
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: Binding(get: {
                coordinator.path
            }, set: { _ in })) {
                coordinator.initialRoute.build()
                    .navigationDestination(for: Route.self) { route in
                        route.build()
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
