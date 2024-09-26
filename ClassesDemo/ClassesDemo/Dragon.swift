class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String){
        print("Say \(speech)")
    }
    override func move() {
        print("Fly")
    }
    
    override func attack() {
        super.attack()
        print("Split")
    }
}
