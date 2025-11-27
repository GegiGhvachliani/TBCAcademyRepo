//
//  QuizRepository.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 26.11.25.
//

import Foundation

class QuizRepository: QuizRepositoryProtocol {
    private var stats: QuizStats = QuizStats()
    private let questions: [Question] = [
        Question(
            id: UUID(),
            question: "Which ancient civilization developed cuneiform writing, built ziggurats, and is considered one of the earliest urban societies in Mesopotamia?",
            answers: ["Greeks", "Persians", "Sumerians", "Romans"],
            correctAnswerIndex: 2
        ),
        Question(
            id: UUID(),
            question: "Which empire created the Royal Road, ruled by Cyrus the Great, and became one of the largest empires of the ancient world?",
            answers: ["Mongols", "Persian Empire", "Ottoman Empire", "Macedonians"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which classical civilization is known for founding democracy, producing philosophers like Plato, and building the Acropolis?",
            answers: ["Hittites", "Greeks", "Carthaginians", "Egyptians"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which empire built the Colosseum, established Roman law, and dominated the Mediterranean region?",
            answers: ["Roman Empire", "Byzantine Empire", "Akkadian Empire", "Maya"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which ancient culture developed the first alphabet, were skilled sailors, and founded Carthage?",
            answers: ["Phoenicians", "Celts", "Scythians", "Saxons"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which ancient kingdom created defensive stone towers called koshki and preserved its traditions in the Caucasus mountains?",
            answers: ["Huns", "Svaneti", "Khazars", "Scythians"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which civilization created the Code of Hammurabi, one of the earliest comprehensive legal codes?",
            answers: ["Assyrians", "Babylonians", "Romans", "Persians"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which empire constructed the Great Wall, invented gunpowder, and developed a long-lasting dynastic system?",
            answers: ["Chinese Empire", "Kushan Empire", "Mali Empire", "Akkadian Empire"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which ancient civilization built Machu Picchu and ruled the Andes before Spanish conquest?",
            answers: ["Olmecs", "Aztecs", "Incas", "Toltecs"],
            correctAnswerIndex: 2
        ),
        Question(
            id: UUID(),
            question: "Which Mesoamerican civilization developed a complex calendar, built pyramids like Chichen Itza, and used hieroglyphics?",
            answers: ["Maya", "Inca", "Hopi", "Toltecs"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which empire was known for its powerful army, iron weaponry, and expansion into the Neo-Assyrian Empire?",
            answers: ["Phoenicians", "Lydians", "Assyrians", "Berbers"],
            correctAnswerIndex: 2
        ),
        Question(
            id: UUID(),
            question: "Which ancient civilization invented paper, the compass, and established a civil service examination system?",
            answers: ["Akkadians", "Spartans", "Chinese", "Huns"],
            correctAnswerIndex: 2
        ),
        Question(
            id: UUID(),
            question: "Which culture built Stonehenge, practiced druidism, and spread across Iron Age Europe?",
            answers: ["Celts", "Persians", "Goths", "Hittites"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which empire preserved Roman knowledge in the East, used Greek as its official language, and built the Hagia Sophia?",
            answers: ["Ottoman Empire", "Byzantine Empire", "Sassanid Empire", "Frankish Empire"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which ancient civilization used quipu knot records for bookkeeping and did not develop a traditional writing system?",
            answers: ["Maya", "Inca", "Egyptians", "Sumerians"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which Middle Eastern civilization created advanced astronomy, developed algebra, and preserved Greek texts during the Islamic Golden Age?",
            answers: ["Umayyads", "Abbasids", "Ottomans", "Seljuks"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which ancient people were known as fearless seafarers, raided European coasts, and explored as far as North America?",
            answers: ["Vikings", "Celts", "Romans", "Huns"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which ancient African empire ruled from Timbuktu, controlled gold trade routes, and reached its height under Mansa Musa?",
            answers: ["Mali Empire", "Aksumite Empire", "Carthaginian Empire", "Zulu Kingdom"],
            correctAnswerIndex: 0
        ),
        Question(
            id: UUID(),
            question: "Which ancient civilization built giant stone heads, influenced later Mesoamerican cultures, and flourished before the Maya?",
            answers: ["Aztecs", "Olmecs", "Zapotecs", "Toltecs"],
            correctAnswerIndex: 1
        ),
        Question(
            id: UUID(),
            question: "Which ancient Anatolian civilization used iron early, fought against Egypt at Kadesh, and collapsed during the Bronze Age?",
            answers: ["Hittites", "Lydians", "Assyrians", "Parthians"],
            correctAnswerIndex: 0
        )
    ]

    
    private static let quizKey = "quizKey"
    
    init() {
        if let savedStats = loadFromUserDefaults() {
            stats = savedStats
        }
    }
    
    func getQuestions() -> [Question] {
        questions
    }
    
    func getStats() -> QuizStats {
        stats
    }
    
    func updateStats(with stats: QuizStats) {
        self.stats = stats
        saveToUserDefaults(stats)
    }
    
    private func saveToUserDefaults(_ stats: QuizStats) {
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(stats) else { return }
        
        UserDefaults.standard.set(data, forKey: QuizRepository.quizKey)
    }
    
    private func loadFromUserDefaults() -> QuizStats? {
        let decoder = JSONDecoder()
        
        guard let data = UserDefaults.standard.data(forKey: QuizRepository.quizKey) else { return nil }
        
        return try? decoder.decode(QuizStats.self, from: data)
    }
    
}
