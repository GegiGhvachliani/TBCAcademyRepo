import Foundation
import UIKit

struct Movie {
    let title: String
    let rating: Double
    let posterName: String
    let bannerName: String
    let type: MovieType
    let genres: [String]
    let duration: String
    let language: String
    let ageRating: String
    let description: String
    let cast: [String]
    
    static let allMovies: [Movie] = [
        Movie(
            title: "Spider-Man: No Way\nHome",
            rating: 9.1,
            posterName: "spiderMan",
            bannerName: "spiderManB",
            type: .nowShowing,
            genres: ["Action", "Adventure", "Fantasy"],
            duration: "2h 28m",
            language: "English",
            ageRating: "PG-13",
            description:
                "Peter Parker's secret identity is revealed to the entire world. Desperate for help, Peter turns to Doctor Strange to make the world forget that he is Spider-Man. The spell goes horribly wrong and shatters the multiverse, bringing in villains from alternate realities.",
            cast: ["Tom Holland", "Zendaya", "Benedict Cumberbatch", "Jacob Batalon"]
        ),
        Movie(
            title: "Eternals",
            rating: 9.5,
            posterName: "eternals",
            bannerName: "eternalsB",
            type: .nowShowing,
            genres: ["Action", "Fantasy", "Sci-Fi"],
            duration: "2h 36m",
            language: "English",
            ageRating: "PG-13",
            description:
                "The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations. Following the events of Avengers: Endgame, they must reunite to protect humanity from their evil counterparts, the Deviants.",
            cast: ["Gemma Chan", "Richard Madden", "Angelina Jolie", "Salma Hayek"]
        ),
        Movie(
            title: "Venom: Let There Be Carnage",
            rating: 6.4,
            posterName: "venom",
            bannerName: "venomB",
            type: .popular,
            genres: ["Horror", "Mystery", "Thriller"],
            duration: "1h 47m",
            language: "English",
            ageRating: "PG-13",
            description:
                "Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.",
            cast: ["Tom Hardy", "Woody Harrelson", "Michelle Williams", "Naomie Harris"]
        ),
        Movie(
            title: "The King's Man",
            rating: 8.4,
            posterName: "kingsMan",
            bannerName: "kingsManB",
            type: .popular,
            genres: ["Action", "Fantasy"],
            duration: "1h 47m",
            language: "English",
            ageRating: "R",
            description:
                "In the early years of the 20th century, the Kingsman agency is formed to stand against a cabal plotting a war to wipe out millions. One man must race against time to stop them.",
            cast: ["Ralph Fiennes", "Gemma Arterton", "Rhys Ifans", "Harris Dickinson"]
        ),
        Movie(
            title: "Shang-Chi",
            rating: 8.1,
            posterName: "shangChi",
            bannerName: "shangChiB",
            type: .nowShowing,
            genres: ["Action", "Adventure", "Fantasy"],
            duration: "2h 12m",
            language: "English",
            ageRating: "PG-13",
            description:
                "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.",
            cast: ["Simu Liu", "Awkwafina", "Tony Leung", "Michelle Yeoh"]
        )
    ]
}
