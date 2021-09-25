//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateRpi1Input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(macId: String, ts: Int) {
    graphQLMap = ["mac_Id": macId, "ts": ts]
  }

  public var macId: String {
    get {
      return graphQLMap["mac_Id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mac_Id")
    }
  }

  public var ts: Int {
    get {
      return graphQLMap["ts"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ts")
    }
  }
}

public struct UpdateRpi1Input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(macId: String, ts: Int) {
    graphQLMap = ["mac_Id": macId, "ts": ts]
  }

  public var macId: String {
    get {
      return graphQLMap["mac_Id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mac_Id")
    }
  }

  public var ts: Int {
    get {
      return graphQLMap["ts"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ts")
    }
  }
}

public struct DeleteRpi1Input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(macId: String, ts: Int) {
    graphQLMap = ["mac_Id": macId, "ts": ts]
  }

  public var macId: String {
    get {
      return graphQLMap["mac_Id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mac_Id")
    }
  }

  public var ts: Int {
    get {
      return graphQLMap["ts"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ts")
    }
  }
}

public struct TableRpi1FilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(macId: TableStringFilterInput? = nil, ts: TableIntFilterInput? = nil) {
    graphQLMap = ["mac_Id": macId, "ts": ts]
  }

  public var macId: TableStringFilterInput? {
    get {
      return graphQLMap["mac_Id"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mac_Id")
    }
  }

  public var ts: TableIntFilterInput? {
    get {
      return graphQLMap["ts"] as! TableIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ts")
    }
  }
}

public struct TableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct TableIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, contains: Int? = nil, notContains: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Int? {
    get {
      return graphQLMap["contains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Int? {
    get {
      return graphQLMap["notContains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreateRpi1Mutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRpi1($input: CreateRpi1Input!) {\n  createRpi1(input: $input) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var input: CreateRpi1Input

  public init(input: CreateRpi1Input) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRpi1", arguments: ["input": GraphQLVariable("input")], type: .object(CreateRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRpi1: CreateRpi1? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createRpi1": createRpi1.flatMap { $0.snapshot }])
    }

    public var createRpi1: CreateRpi1? {
      get {
        return (snapshot["createRpi1"] as? Snapshot).flatMap { CreateRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createRpi1")
      }
    }

    public struct CreateRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class UpdateRpi1Mutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateRpi1($input: UpdateRpi1Input!) {\n  updateRpi1(input: $input) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var input: UpdateRpi1Input

  public init(input: UpdateRpi1Input) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateRpi1", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateRpi1: UpdateRpi1? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateRpi1": updateRpi1.flatMap { $0.snapshot }])
    }

    public var updateRpi1: UpdateRpi1? {
      get {
        return (snapshot["updateRpi1"] as? Snapshot).flatMap { UpdateRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateRpi1")
      }
    }

    public struct UpdateRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class DeleteRpi1Mutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteRpi1($input: DeleteRpi1Input!) {\n  deleteRpi1(input: $input) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var input: DeleteRpi1Input

  public init(input: DeleteRpi1Input) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteRpi1", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteRpi1: DeleteRpi1? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteRpi1": deleteRpi1.flatMap { $0.snapshot }])
    }

    public var deleteRpi1: DeleteRpi1? {
      get {
        return (snapshot["deleteRpi1"] as? Snapshot).flatMap { DeleteRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteRpi1")
      }
    }

    public struct DeleteRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class GetRpi1Query: GraphQLQuery {
  public static let operationString =
    "query GetRpi1($mac_Id: String!, $ts: Int!) {\n  getRpi1(mac_Id: $mac_Id, ts: $ts) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var mac_Id: String
  public var ts: Int

  public init(mac_Id: String, ts: Int) {
    self.mac_Id = mac_Id
    self.ts = ts
  }

  public var variables: GraphQLMap? {
    return ["mac_Id": mac_Id, "ts": ts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRpi1", arguments: ["mac_Id": GraphQLVariable("mac_Id"), "ts": GraphQLVariable("ts")], type: .object(GetRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRpi1: GetRpi1? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRpi1": getRpi1.flatMap { $0.snapshot }])
    }

    public var getRpi1: GetRpi1? {
      get {
        return (snapshot["getRpi1"] as? Snapshot).flatMap { GetRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRpi1")
      }
    }

    public struct GetRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class ListRpi1SQuery: GraphQLQuery {
  public static let operationString =
    "query ListRpi1S($filter: TableRpi1FilterInput, $limit: Int, $nextToken: String) {\n  listRpi1S(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      mac_Id\n      ts\n    }\n    nextToken\n  }\n}"

  public var filter: TableRpi1FilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: TableRpi1FilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listRpi1S", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listRpi1S: ListRpi1? = nil) {
      self.init(snapshot: ["__typename": "Query", "listRpi1S": listRpi1S.flatMap { $0.snapshot }])
    }

    public var listRpi1S: ListRpi1? {
      get {
        return (snapshot["listRpi1S"] as? Snapshot).flatMap { ListRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listRpi1S")
      }
    }

    public struct ListRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1Connection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "Rpi1Connection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Rpi1"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
          GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(macId: String, ts: Int) {
          self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var macId: String {
          get {
            return snapshot["mac_Id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mac_Id")
          }
        }

        public var ts: Int {
          get {
            return snapshot["ts"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ts")
          }
        }
      }
    }
  }
}

public final class OnCreateRpi1Subscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateRpi1($mac_Id: String, $ts: Int) {\n  onCreateRpi1(mac_Id: $mac_Id, ts: $ts) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var mac_Id: String?
  public var ts: Int?

  public init(mac_Id: String? = nil, ts: Int? = nil) {
    self.mac_Id = mac_Id
    self.ts = ts
  }

  public var variables: GraphQLMap? {
    return ["mac_Id": mac_Id, "ts": ts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateRpi1", arguments: ["mac_Id": GraphQLVariable("mac_Id"), "ts": GraphQLVariable("ts")], type: .object(OnCreateRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateRpi1: OnCreateRpi1? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateRpi1": onCreateRpi1.flatMap { $0.snapshot }])
    }

    public var onCreateRpi1: OnCreateRpi1? {
      get {
        return (snapshot["onCreateRpi1"] as? Snapshot).flatMap { OnCreateRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateRpi1")
      }
    }

    public struct OnCreateRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class OnUpdateRpi1Subscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateRpi1($mac_Id: String, $ts: Int) {\n  onUpdateRpi1(mac_Id: $mac_Id, ts: $ts) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var mac_Id: String?
  public var ts: Int?

  public init(mac_Id: String? = nil, ts: Int? = nil) {
    self.mac_Id = mac_Id
    self.ts = ts
  }

  public var variables: GraphQLMap? {
    return ["mac_Id": mac_Id, "ts": ts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateRpi1", arguments: ["mac_Id": GraphQLVariable("mac_Id"), "ts": GraphQLVariable("ts")], type: .object(OnUpdateRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateRpi1: OnUpdateRpi1? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateRpi1": onUpdateRpi1.flatMap { $0.snapshot }])
    }

    public var onUpdateRpi1: OnUpdateRpi1? {
      get {
        return (snapshot["onUpdateRpi1"] as? Snapshot).flatMap { OnUpdateRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateRpi1")
      }
    }

    public struct OnUpdateRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}

public final class OnDeleteRpi1Subscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteRpi1($mac_Id: String, $ts: Int) {\n  onDeleteRpi1(mac_Id: $mac_Id, ts: $ts) {\n    __typename\n    mac_Id\n    ts\n  }\n}"

  public var mac_Id: String?
  public var ts: Int?

  public init(mac_Id: String? = nil, ts: Int? = nil) {
    self.mac_Id = mac_Id
    self.ts = ts
  }

  public var variables: GraphQLMap? {
    return ["mac_Id": mac_Id, "ts": ts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteRpi1", arguments: ["mac_Id": GraphQLVariable("mac_Id"), "ts": GraphQLVariable("ts")], type: .object(OnDeleteRpi1.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteRpi1: OnDeleteRpi1? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteRpi1": onDeleteRpi1.flatMap { $0.snapshot }])
    }

    public var onDeleteRpi1: OnDeleteRpi1? {
      get {
        return (snapshot["onDeleteRpi1"] as? Snapshot).flatMap { OnDeleteRpi1(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteRpi1")
      }
    }

    public struct OnDeleteRpi1: GraphQLSelectionSet {
      public static let possibleTypes = ["Rpi1"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mac_Id", type: .nonNull(.scalar(String.self))),
        GraphQLField("ts", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(macId: String, ts: Int) {
        self.init(snapshot: ["__typename": "Rpi1", "mac_Id": macId, "ts": ts])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var macId: String {
        get {
          return snapshot["mac_Id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mac_Id")
        }
      }

      public var ts: Int {
        get {
          return snapshot["ts"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ts")
        }
      }
    }
  }
}