struct Enemy {
    var health = 100
    var attackStrength = 10
    
    init(health: Int = 100, attackStrength: Int = 10) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func move(){
        print("Walk")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrength) dammage.")
    }
    
    mutating func takeDamage(amount: Int){
        health -= amount
    }
}
