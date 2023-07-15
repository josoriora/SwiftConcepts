//: [Previous](@previous)

import Foundation

class MyAction {
    var actionOne: (() -> (Void))?
    
    deinit {
        print("chao")
    }
}

class MyClass {
    var onEnd: (() -> (Void))?
    
    func executeAfterEnd(action: MyAction) {
        onEnd = {
            print("on End")
            action.actionOne?()
        }
    }
    
    func executeOnEnd() {
        onEnd?()
    }
    
    deinit {
        print("bye")
    }
}

var myClass: MyClass? = MyClass()
var action: MyAction? = MyAction()

action?.actionOne = {
    print("action one")
}

myClass?.executeAfterEnd(action: action!)
myClass?.executeOnEnd()

myClass = nil
action = nil


//: [Next](@next)
