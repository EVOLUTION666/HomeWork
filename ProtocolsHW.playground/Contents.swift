import UIKit

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления


enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Comparable {
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case (math(rating: let a), math(rating: let b)): return a < b
            case (nativeLanguage(rating: let a), nativeLanguage(rating: let b)): return a < b
            case (computerSince(rating: let a), computerSince(rating: let b)): return a < b
            case (literature(rating: let a), literature(rating: let b)): return a < b
            default:
                return false
        }
    }

    static func <= (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case (math(rating: let a), math(rating: let b)): return a <= b
            case (nativeLanguage(rating: let a), nativeLanguage(rating: let b)): return a <= b
            case (computerSince(rating: let a), computerSince(rating: let b)): return a <= b
            case (literature(rating: let a), literature(rating: let b)): return a <= b
            default:
                return false
        }
    }

    static func >= (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case (math(rating: let a), math(rating: let b)): return a >= b
            case (nativeLanguage(rating: let a), nativeLanguage(rating: let b)): return a >= b
            case (computerSince(rating: let a), computerSince(rating: let b)): return a >= b
            case (literature(rating: let a), literature(rating: let b)): return a >= b
            default:
                return false
        }
    }

    static func > (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case (math(rating: let a), math(rating: let b)): return a > b
            case (nativeLanguage(rating: let a), nativeLanguage(rating: let b)): return a > b
            case (computerSince(rating: let a), computerSince(rating: let b)): return a > b
            case (literature(rating: let a), literature(rating: let b)): return a > b
            default:
                return false
        }
    }
}

let comparableLiterature1 = LessonType.literature(rating: 1)
let comparableLiterature2 = LessonType.literature(rating: 2)
print(comparableLiterature1 > comparableLiterature2)
print(comparableLiterature1 < comparableLiterature2)
print(comparableLiterature1 >= comparableLiterature2)
print(comparableLiterature1 <= comparableLiterature2)



// Задание №2
// Реализуйте протокол Equatable у LessonType

extension LessonType: Equatable {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (math(rating: let a), math(rating: let b)): return a == b
        case (nativeLanguage(rating: let a), nativeLanguage(rating: let b)): return a == b
        case (computerSince(rating: let a), computerSince(rating: let b)): return a == b
        case (literature(rating: let a), literature(rating: let b)): return a == b
        default:
           return false
        }
    }
}

let equatableMath1 = LessonType.math(rating: 5)
let equatableMath2 = LessonType.math(rating: 3)
print(equatableMath1 == equatableMath2)
