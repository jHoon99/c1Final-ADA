//
//  Runner.swift
//  c1Final @ADA
//
//  Created by 조재훈 on 3/26/25.
//

import Foundation


struct Runner: Identifiable {
    let id = UUID()
    let name: String
    let nickname: String
    
}

let exampleRunners = [
    Runner(name: "조재훈", nickname: "Kadan"),
    Runner(name: "박민영", nickname: "nell"),
    Runner(name: "이민철", nickname: "yoshi"),
]

extension Runner {
    static var allNicknames: [String] {
        return runnerNicknames
    }
    
    static func isNicknameValid(_ nickname: String) -> Bool {
        return runnerNicknames.contains(nickname.lowercased())
    }
    
    static let runnerNicknames = [
        "presence", "jooni", "herry", "jerry", "jeje", "soop", "paduck", "cerin", "ian", "julianne",
        "luke", "green", "rohd", "weaver", "alex", "jina", "monica", "kinder", "riel", "lina", "hevyn",
        "yuha", "powel", "rama", "romak", "leon", "theo", "ari", "skyler", "miru", "kaia", "il", "taki",
        "daniely", "seo", "peppr", "isa", "mary", "one", "isla", "ivy", "yoshi", "pray", "gyeong", "singsing",
        "rundo", "lemon", "jung", "joid", "libby", "root", "hong", "loa", "erin", "jeong", "tether", "coulson",
        "emma", "my", "luka", "bob", "zigu", "enoch", "lucas", "paran", "eifer", "karyn", "hari", "bota",
        "eddey", "velko", "nayl", "minbol", "gil", "jenna", "sandeul", "zani", "anne", "dewy", "oliver",
        "nell", "kadan", "mumin", "paidion", "sally", "excellenty", "jack", "sena", "dean", "bear", "nika",
        "yan", "nike", "viera", "evan", "nyx", "hama", "demian", "yeony", "onething", "cheshire", "pherd",
        "may", "jenki", "echo", "dodin", "jin", "berry", "kwangro", "joy", "wish", "baba", "air", "frank",
        "hyun", "mingky", "ria", "woody", "glowny", "jun", "mini", "ted", "jomi", "wade", "bin", "sky", "j",
        "ella", "ken", "ssol", "finn", "steve", "jam", "leo", "cherry", "gabi", "ethan", "jaeryong", "taeni",
        "way", "sera", "kon", "zhen", "min", "elphie", "noah", "fine", "yoon", "moo", "judyj", "simi", "murphy",
        "kave", "junia", "ell", "go", "snow", "angie", "brandnew", "yuu", "martin", "three", "elena", "noter",
        "elian", "sana", "ito", "gus", "chloe", "gigi", "wendy", "hidy", "wonjun", "henry", "kirby", "avery",
        "happyjay", "heggy", "mosae", "jacob", "gommin", "nathan", "daisy", "dora", "lumi", "leeo", "saya",
        "sup", "mk", "jason", "judy", "jiku", "friday", "howard", "gwen", "soo", "sunny", "summer", "sungp",
        "young", "lingo", "hailey", "isaac", "jinny", "scarly"
    ]
}


import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64

        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
