import UIKit

// Перед тем как делать, можно посмотреть вот это. Своеобразное введение в protocol oriented programming
// https://www.raywenderlich.com/6742901-protocol-oriented-programming-tutorial-in-swift-5-1-getting-started
// Но если любите по харду, то можете начать сами, а потом посмотреть.))


// Если вам будет лень придумывать героев, вот ссылка на их источник
//https://liquipedia.net/warcraft/Races

// Задание #1 (обязательно)
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin
// По желанию можно выполнить необязательные задания

// Совет:
// Предлагаю использовать ульту(способность) героев в виде Enum при проектировании
//enum AttakStyle: String {
//    case melee = "melee attak!"
//    case longRange = "long range attak!"
//}

// Задание №2 (необязательно)
// Добавьте Гильдию. Мы можем это использовать, чтобы ненужно было создавать отдельную структуру под Orc
//enum GuildType {
//    case aliance
//    case orc
//}

// Задание №3 (необязательно)
// Добавьте свой-во currentPosition: CGPoint. Теперь Героев можно передвигать и при этом у них будет меняться currentPosition. Дороботайте для этого функцию move()

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)


// Далее Задание №5 (необязательно)
// Подходите к заданию творчески, используйте свой функционал, придумывайте его не надо стесняться)))
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
// 5.3 Отсортируйте по мощности атаки attackPower
// 5.4 Найдите самого сильного в массиве (attackPower) или того у кого больше всего mana

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев
// Используйте пример из презы_)

protocol Movable {
    var currentPosition: CGPoint { get }
    mutating func move(to position: CGPoint)
    func stop()
    mutating func fly(to point: CGPoint)
}

extension Movable {
    
    func stop() {
        print("Stop here [X=\(currentPosition.x), Y=\(currentPosition.y)]!")
    }
}

protocol Actionable {
    var attackStyle: AttackStyle { get }
    func attack()
    func ultimate()
}

extension Actionable {
    
    func attack() {
        print("Attack!")
    }
    
    func ultimate() {
        print(attackStyle.rawValue)
    }
}

enum GuildType: String, Comparable {
    static func < (lhs: GuildType, rhs: GuildType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case aliance
    case orc
}

enum AttackStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

struct Statistics {
    private(set) var armor: Float
    private(set) var attackPower: Float
    private(set) var strength: Float
    private(set) var agility: Float
    private(set) var intelligence: Float
    private(set) var hitPoints: Float
    private(set) var mana: Float

    
    mutating func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
}

struct Hero: Movable, Actionable {

    private(set) var currentPosition: CGPoint
    private(set) var statistics: Statistics
    private(set) var guildType: GuildType
    private(set) var isFlyable = false
    var attackStyle: AttackStyle

    mutating func move(to position: CGPoint) {
        self.currentPosition = position
        print("Move to position [X=\(position.x), Y=\(position.y)]!")
    }
    
    mutating func fly(to point: CGPoint) {
        if isFlyable {
            currentPosition = point
            print("Hero is flyable to point [X=\(point.x), Y=\(point.y)]")
        } else {
            print("Hero can't fly!")
        }
    }
    
    init(statistics: Statistics, attackStyle: AttackStyle, guildType: GuildType, startPosition: CGPoint = .zero, isFlyable: Bool) {
        self.statistics = statistics
        self.guildType = guildType
        self.attackStyle = attackStyle
        self.currentPosition = startPosition
        self.isFlyable = isFlyable
    }

    mutating func updateStatistics(_ statistics: Statistics) {
        self.statistics.updateStatistics(statistics)
    }

    func info() {
        print("\(String(describing: self))")
    }
}

let archMageStatistic = Statistics(armor: 10, attackPower: 60, strength: 5, agility: 20, intelligence: 10, hitPoints: 10, mana: 30)
var archMage = Hero(statistics: archMageStatistic, attackStyle: .melee, guildType: .aliance, isFlyable: false)

let baneStatistic = Statistics(armor: 5, attackPower: 10, strength: 15, agility: 20, intelligence: 25, hitPoints: 5, mana: 20)
var bane = Hero(statistics: baneStatistic, attackStyle: .longRange, guildType: .aliance, isFlyable: true)

let abadonStatistic = Statistics(armor: 40, attackPower: 30, strength: 30, agility: 5, intelligence: 5, hitPoints: 15, mana: 15)
var abadon = Hero(statistics: abadonStatistic, attackStyle: .melee, guildType: .orc, isFlyable: false)

let axeStatistic = Statistics(armor: 50, attackPower: 50, strength: 25, agility: 3, intelligence: 4, hitPoints: 1, mana: 15)
var axe = Hero(statistics: axeStatistic, attackStyle: .melee, guildType: .orc, isFlyable: false)

let invokerStatistic = Statistics(armor: 25, attackPower: 25, strength: 10, agility: 10, intelligence: 10, hitPoints: 5, mana: 20)
var invoker = Hero(statistics: archMageStatistic, attackStyle: .longRange, guildType: .aliance, isFlyable: true)

var heros: [Hero] = [archMage, bane, abadon, axe, invoker]

heros.sort(by: {$0.guildType > $1.guildType})
print(heros.map({$0.guildType.rawValue}))

heros.sort(by:  {$0.statistics.attackPower > $1.statistics.attackPower})
print(heros.map({$0.statistics.attackPower}))

print(heros.max(by: {$0.statistics.attackPower < $1.statistics.attackPower})!.statistics.attackPower)


archMage.ultimate()
archMage.move(to: CGPoint(x: 5.0, y: 5.0))
archMage.stop()
archMage.move(to: .init(x: 10.0, y: 20.0))
archMage.fly(to: .init(x: 5.0, y: 5.0))
archMage.stop()

