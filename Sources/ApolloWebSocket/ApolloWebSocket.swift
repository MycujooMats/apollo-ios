import Starscream
import Foundation

// MARK: - Client protocol

/// Protocol allowing alternative implementations of web sockets beyond `ApolloWebSocket`. Extends `Starscream`'s `WebSocketClient` protocol.
public protocol ApolloWebSocketClient: WebSocketClient {

  /// Required initializer
  ///
  /// - Parameter request: The URLRequest to use on connection.
  /// - Parameter protocols: The supported protocols
  init(request: URLRequest, protocols: [String]?)

  /// The URLRequest used on connection.
  var request: URLRequest { get set }

  /// Queue where the callbacks are executed
  var callbackQueue: DispatchQueue { get set }
}

public protocol SOCKSProxyable {
  
  /// Determines whether a SOCKS proxy is enabled on the underlying request.
  /// Mostly useful for debugging with tools like Charles Proxy.
  var enableSOCKSProxy: Bool { get set }
}

// MARK: - WebSocket

/// Included implementation of an `ApolloWebSocketClient`, based on `Starscream`'s `WebSocket`.
public class ApolloWebSocket: WebSocket, ApolloWebSocketClient, SOCKSProxyable {
  
  public var enableSOCKSProxy: Bool {
    get {
      return false
    }
    set {
        
    }
  }

  required public convenience init(request: URLRequest, protocols: [String]? = nil) {
    self.init(request: request,
              protocols: protocols)
  }
}
