//
//  Movies.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 03.11.23.
//

import UIKit

let genres: [String] = ["Action", "Adventure", "Crime", "Drama", "Comedy", "Horror"]

struct Movies {
    let name: String?
    let imageName: String?
    let rating: String?
    let description: String?
    let certificate: String?
    let runtime: String?
    let date: String?
    let mainGenre: String?
    let allGenres: String?
    let director: String?
    let cast: String?
    let secondImage: String?
}

let batman = Movies(name: "The Batman",
                    imageName: "batman",
                    rating: "8.3",
                    description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
                    certificate: "16+",
                    runtime: "02:56",
                    date: "2022",
                    mainGenre: "Action",
                    allGenres: "Action, Crime, Drama",
                    director: "Matt Reeves",
                    cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, Andy Serkis, Peter Sarsgaard",
                    secondImage: "batman2")

let uncharted = Movies(name: "Uncharted",
                    imageName: "uncharted",
                    rating: "7.5",
                    description: "Nathan Drake, a treasure hunter, is forced to team up with Victor Sullivan to retrieve a fortune left by Ferdinand Magellan.",
                    certificate: "PG-13",
                    runtime: "01:56",
                    date: "2022",
                    mainGenre: "Action",
                    allGenres: "Action, Adventure",
                    director: "Ruben Fleischer",
                    cast: "Tom Holland, Mark Wahlberg, Antonio Banderas, Sophia Ali, Tati Gabrielle",
                    secondImage: "uncharted2")

let exorcismOfGod = Movies(name: "Exorcism of God",
                    imageName: "exorcism_of_god",
                    rating: "6.8",
                    description: "A priest participates in an exorcism that will ultimately take him to the Holy Land and confront a demon with fearsome powers.",
                    certificate: "R",
                    runtime: "02:10",
                    date: "2022",
                    mainGenre: "Horror",
                    allGenres: "Horror, Mystery, Thriller",
                    director: "Gus Krieger",
                    cast: "Joseph Marcell, Mariam Al-ferjani, Sophia Cacciola, PeiPei Alena Yuan",
                    secondImage: "exorcism_of_god2")

let turningRed = Movies(name: "Turning Red",
                    imageName: "turning_red",
                    rating: "7.3",
                    description: "Mei Lee, a young girl who turns into a giant red panda when she gets too excited, must learn to balance her new life and her mother's expectations.",
                    certificate: "PG",
                    runtime: "01:43",
                    date: "2022",
                    mainGenre: "Animation",
                    allGenres: "Animation, Adventure, Comedy",
                    director: "Domee Shi",
                    cast: "Rosalie Chiang, Sandra Oh, Ava Morse, Maitreyi Ramakrishnan, Carolyn Fe, Wai Ching Ho",
                    secondImage: "turning_red2")

let spiderManNoWayHome = Movies(name: "Spider-Man: No Way Home",
                    imageName: "spiderman",
                    rating: "8.5",
                    description: "Spider-Man's identity is revealed, and he seeks help from Doctor Strange to make the world forget his secret. However, their spell goes awry, bringing villains from other dimensions into their world.",
                    certificate: "PG-13",
                    runtime: "02:28",
                    date: "2021",
                    mainGenre: "Action",
                    allGenres: "Action, Adventure, Fantasy",
                    director: "Jon Watts",
                    cast: "Tom Holland, Zendaya, Benedict Cumberbatch, Jacob Batalon, Marisa Tomei, Willem Dafoe, Alfred Molina",
                    secondImage: "spiderman2")

let morbius = Movies(name: "Morbius",
                     imageName: "morbius",
                     rating: "6.2",
                     description: "Dr. Michael Morbius, a brilliant scientist, attempts to cure his rare blood disorder with an experimental treatment that inadvertently turns him into a living vampire.",
                     certificate: "PG-13",
                     runtime: "01:44",
                     date: "2022",
                     mainGenre: "Action",
                     allGenres: "Action, Adventure, Drama",
                     director: "Daniel Espinosa",
                     cast: "Jared Leto, Matt Smith, Adria Arjona, Jared Harris, Al Madrigal, Tyrese Gibson", 
                     secondImage: "morbius2")


let movies: [Movies] = [batman, uncharted, exorcismOfGod, turningRed, spiderManNoWayHome, morbius]
