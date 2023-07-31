import Foundation

class MockupUtilities {
    
    public static func getRandomFollowerCount() -> Int {
        return Int.random(in:1000..<5000)
    }
    
    private static func truncateThousandsValue(i: Int, suffix: String = "K") -> String {
        if i < 1000 {
            return "\(i)"
        }
        
        let rem = i % 1000
        let remH = rem % 100
        let thousands = Double(i - rem) / 1000.0
        let hundreds = ((rem - remH) / 100)
        
        return "\(thousands).\(hundreds)\(suffix)"
    }

    public static func getMockFollowerCount() -> String {
        // Return something like "42.3K", "1.8k", etc.
        let random: Int = getRandomFollowCount()
        return truncateThousandsValue(i: random)
    }
    
    /*
     * Time formats
     * Where "X" represents the time as the subsequent symbol
     * Just now - Within fifteen seconds
     * Xs - Seconds ago
     * Xm - Minutes ago
     * Xh - Hours ago
     * Xd - Days ago
     * Xw - Weeks ago
     */
    private static func getRandomTimeByDenomination(den: String = "h") -> Int {
        let random: Int
        if den == "Just now" {
            random = -1
        } else if den == "s" {
            random = Int.random(in: 15..<60)
        } else if den == "m" {
            random = Int.random(in: 1..<60)
        } else if den == "h" {
            random = Int.random(in: 1..<24)
        } else if den == "d" {
            random = Int.random(in: 1..<31)
        } else if den == "w" {
            random = Int.random(in: 1...3)
        } else {
            // Assume months
            random = Int.random(in: 1...)
        }
        return random
    }
    
    public static func getRandomTime(denomination: String = "h") -> String {
        let randomTime = getRandomTimeByDenomination(den: denomination)
        return "\(randomTime)\(denomination)"
    }
    
    public static func getRandomDenominatedTime() -> String {
        let validDenominations: [String] = ["s", "m", "h", "d", "w"]
        return getRandomTime(denomination: validDenominations.randomElement())
    }
}

