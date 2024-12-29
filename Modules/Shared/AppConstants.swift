import OSLog

public struct AppConstants: Sendable
{
    public static let shared: Self = .init()
    
    public let logger: Logger = .init(subsystem: "com.davidbures.simply-licenses", category: "general")
}
