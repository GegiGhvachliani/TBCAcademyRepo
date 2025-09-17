public func resultFor(exercise: String, action: ()->()) {
    print("🔴   \(exercise)   🔴\n   ")
    action()
    print("\n")
    print("----------------")
}

