//let myOptional: String?
//
//myOptional = nil
//
//let text: String = myOptional ?? "default"
//
//print(text)

struct MyOptional {
    var property = 123
    func method(){
        print("method")
    }
}

let myOptional: MyOptional?

myOptional = MyOptional()

print(myOptional?.property)
