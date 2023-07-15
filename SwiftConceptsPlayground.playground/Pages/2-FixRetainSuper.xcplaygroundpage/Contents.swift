import UIKit

class Parent {
    func parentMethod() {
        print("parent")
    }
}

class Child: Parent {
    var closure: (() -> (Void))? = nil
    
    override init() {
        super.init()
    }
    
    func setClosure() {
        closure = { [weak self] in
            self?.superParentMethod()
        }
    }
    
    override func parentMethod() {
        print("child")
    }
    
    func superParentMethod() {
        super.parentMethod()
    }
    
    deinit {
        print("I am out")
    }
}

var child: Child? = Child()

child?.setClosure()
child = nil
