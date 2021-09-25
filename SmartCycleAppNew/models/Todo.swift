// swiftlint:disable all
import Amplify
import Foundation

public struct Todo: Model {
  public let id: String
  public var timestamp: String
  public var description: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      timestamp: String,
      description: String? = nil) {
    self.init(id: id,
      timestamp: timestamp,
      description: description,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      timestamp: String,
      description: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.timestamp = timestamp
      self.description = description
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}