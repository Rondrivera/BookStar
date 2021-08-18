////
////  DataSet.swift
////  BookStar
////
////  Created by Ronald Rivera on 11/17/20.
////
//
//import Foundation
//
//class DataSet {
//
//    let categories = [
//        BookGenre(title: "Fiction", imageName: "fiction0"),
//        BookGenre(title: "Fantasy", imageName: "fantasy0"),
//        BookGenre(title: "Non-fiction", imageName: "nonFiction0"),
//        BookGenre(title: "Biography", imageName: "biography0"),
//        BookGenre(title: "Poetry", imageName: "poetry0")
//    ]
//
//    let fiction = [
//        BookReview(title: "Charlotte's Web", description: "The story of a pig named Wilbur and his friendship with a barn spider named Charlotte. When Wilbur is in danger of being slaughtered by the farmer, Charlotte writes messages praising Wilbur in her web in order to persuade the farmer to let him live.", imageName: "fiction1"),
//        BookReview(title: "Matilda", description: "A very smart little girl who lives with her mean parents that don't care about a word she says. Her parents finally decide to send her to school, and Matilda has the sweetest teacher, Miss Honey but not a very nice principle, Miss Trunchbull. Matilda is about to find out that she has a special power.", imageName: "fiction2"),
//        BookReview(title: "Because of Winn Dixie", description: "Abandoned by her mother years ago, Opal (AnnaSophia Robb), a 10-year-old girl, moves with her preacher father to a small town in Florida. Lonely and missing her old friends, Opal is ecstatic to find companionship with a rambunctious little dog she names Winn-Dixie, after the store where she found the pup. With Winn-Dixie's help, Opal befriends several colorful townsfolk and even begins mending her relationship with her father.", imageName: "fiction3"),
//        BookReview(title: "Tales of a Fourth grade nothing", description: "The mischievous Fudge wreaks havoc on the lives of his family, especially that of his older brother, Peter.", imageName: "fiction4"),
//        BookReview(title: "The One and only Ivan", description: "Ivan is an easygoing gorilla. Living at the Exit 8 Big Top Mall and Video Arcade, he has grown accustomed to humans watching him through the glass walls of his domain. He rarely misses his life in the jungle. In fact, he hardly ever thinks about it at all. Instead, Ivan thinks about TV shows he's seen and about his friends Stella, an elderly elephant, and Bob, a stray dog. But mostly Ivan thinks about art and how to capture the taste of a mango or the sound of leaves with color and a well-placed line.  Then he meets Ruby, a baby elephant taken from her family, and she makes Ivan see their home—and his own art—through new eyes. When Ruby arrives, change comes with her, and it's up to Ivan to make it a change for the better.", imageName: "fiction5"),
//        BookReview(title: "Breakfast Cheeseburger", description: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger5"),
//        BookReview(title: "Double Cheeseburger", description: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger6"),
//        BookReview(title: "Bacon Cheeseburger", description: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger0"),
//        BookReview(title: "Open Face Onionator", description: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger1")
//
////        Recipe(title: "Double Cheeseburger", instructions: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger6")
//    ]
//
//    let fantasy = [
//        BookReview(title: "The Chronicles of Narnia: The Lion, the witch, and the wardrobe", description: "During the World War II bombings of London, four English siblings are sent to a country house where they will be safe. One day Lucy finds a wardrobe that transports her to a magical world called Narnia. ... There they join the magical lion, Aslan, in the fight against the evil White Witch, Jadis.", imageName: "fantasy1"),
//        BookReview(title: "James and the Giant Peach", description: "James Henry Trotter lives with his two horrid aunts, Spiker and Sponge. He hasn't got a single friend in the whole wide world. That is not, until he meets the Old Green Grasshopper and the rest of the insects aboard a giant, magical peach! James and the Giant Peach was Roald Dahl's first classic novel for children.", imageName: "fantasy2"),
//        BookReview(title: "The Wizard of Oz", description: "When a tornado rips through Kansas, Dorothy and her dog, Toto, are whisked away in their house to the magical land of Oz. They follow the Yellow Brick Road toward the Emerald City to meet the Wizard, and en route they meet a Scarecrow that needs a brain, a Tin Man missing a heart, and a Cowardly Lion who wants courage.", imageName: "fantasy3"),
//        BookReview(title: "Charlie and the Chocolate Factory", description: "A young boy wins a tour through the most magnificent chocolate factory in the world, led by the world's most unusual candy maker. When Willy Wonka decides to let five children into his chocolate factory, he decides to release five golden tickets in five separate chocolate bars, causing complete mayhem.", imageName: "fantasy4"),
//        BookReview(title: "Where the wild things are", description: "The story of a little boy and main character of the story, named Max. After his mother sends him to bed without dinner, Max falls asleep and his room immediately transforms into a moonlit forest surrounded by a vast ocean.", imageName: "fantasy5"),
//        BookReview(title: "Bigoli", description: "Melt butter in medium saucepan with olive oil over medium/low heat. \nAdd the garlic, cream, white pepper and bring mixture to a simmer. \nStir often. \nAdd the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.", imageName: "pasta5"),
//        BookReview(title: "Mezzulene", description: "Melt butter in medium saucepan with olive oil over medium/low heat. \nAdd the garlic, cream, white pepper and bring mixture to a simmer. \nStir often. \nAdd the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.", imageName: "pasta6"),
//        BookReview(title: "Spaghetti", description: "Melt butter in medium saucepan with olive oil over medium/low heat. \nAdd the garlic, cream, white pepper and bring mixture to a simmer. \nStir often. \nAdd the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.", imageName: "pasta0"),
//        BookReview(title: "Tortellini", description: "Melt butter in medium saucepan with olive oil over medium/low heat. \nAdd the garlic, cream, white pepper and bring mixture to a simmer. \nStir often. \nAdd the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.", imageName: "pasta1")
//
//    ]
//
//    let nonFiction = [
//        BookReview(title: "Moonshot: The Flight of Apollo 11", description: "The story of the first American manned moon landing, Apollo 11 in 1969. It's told in a simple manner and doesn't contain too many facts for young readers.  The illustrations are very detailed and the story is written in poetic form.  From Earth to moon and back again, it's the perfect book for young elementary readers.", imageName: "nonFiction1"),
//        BookReview(title: "So you want to be President", description: "The book includes information about the education, family, and prior occupations of Presidents, as well as facts about their Vice Presidents.", imageName: "nonFiction2"),
//        BookReview(title: "How to be an elephant", description: "A baby African elephant is born and immediately begins developing the important skills necessary to survive in the wild. In detailed accounts that integrate descriptions of elephant anatomy, behavior, and development, Roy carefully explains how the baby learns to walk, communicate, listen, and use her trunk.", imageName: "nonFiction3"),
//        BookReview(title: "Seedfolks", description: "A Vietnamese girl plants six lima beans in a Cleveland vacant lot. Looking down on the immigrant-filled neighborhood, a Romanian woman watches suspiciously. A school janitor gets involved, then a Guatemalan family. Then muscle-bound Curtis, trying to win back Lateesha. Pregnant Maricela. Amir from India. A sense of community sprouts and spreads. ", imageName: "nonFiction4"),
//        BookReview(title: "Last stop on Market Street", description: "A story about appreciating differences, happiness, and inequity. Every Sunday after church, CJ and his Nana take the bus to its last stop on Market Street. This Sunday, CJ begins to wonder why they have to wait in the rain, why they don't have a car, why they always make this trip.", imageName: "nonFiction5"),
//        BookReview(title: "Grilled Pizza", description: "1 1/2 cups (355 ml) warm water (105°F-115°F) \n1 package (2 1/4 teaspoons) of active dry yeast \n3 3/4 cups (490 g) bread flour \n2 Tbsp olive oil (omit if cooking pizza in a wood-fired pizza oven) \n2 teaspoons salt \n1 teaspoon sugar", imageName: "pizza5"),
//        BookReview(title: "Veggies Pizza", description: "1 1/2 cups (355 ml) warm water (105°F-115°F) \n1 package (2 1/4 teaspoons) of active dry yeast \n3 3/4 cups (490 g) bread flour \n2 Tbsp olive oil (omit if cooking pizza in a wood-fired pizza oven) \n2 teaspoons salt \n1 teaspoon sugar", imageName: "pizza6"),
//        BookReview(title: "Neapolitan Pizza", description: "1 1/2 cups (355 ml) warm water (105°F-115°F) \n1 package (2 1/4 teaspoons) of active dry yeast \n3 3/4 cups (490 g) bread flour \n2 Tbsp olive oil (omit if cooking pizza in a wood-fired pizza oven) \n2 teaspoons salt \n1 teaspoon sugar", imageName: "pizza0"),
//        BookReview(title: "Salad Pizza", description: "1 1/2 cups (355 ml) warm water (105°F-115°F) \n1 package (2 1/4 teaspoons) of active dry yeast \n3 3/4 cups (490 g) bread flour \n2 Tbsp olive oil (omit if cooking pizza in a wood-fired pizza oven) \n2 teaspoons salt \n1 teaspoon sugar", imageName: "pizza1")
//
//    ]
//
//    let biography = [
//        BookReview(title: "Duke Ellington", description: "Duke Ellington was the greatest jazz composer and bandleader of his time. One of the originators of big-band jazz, he led his band for more than 50 years and composed thousands of scores.", imageName: "biography1"),
//        BookReview(title: "Untamed: The wildlife of Jane Goodall", description: "One of the most recognized scientists in the Western world, became internationally famous because of her ability to observe and connect with another species.", imageName: "biography2"),
//        BookReview(title: "The Watcher: Jane Goodall's life with the Chimps", description: "Jane Goodall, the great observer of chimpanzees. Follow Jane from her childhood in London watching a robin on her windowsill, to her years in the African forests of Gombe, Tanzania, invited by brilliant scientist Louis Leakey to observe chimps, to her worldwide crusade to save these primates.", imageName: "biography3"),
//        BookReview(title: "Balloons over Broadway", description: "A Sibert Medal-winning picture book biography and perfect Thanksgiving Day read about the invention of the first balloons for the Macys Thanksgiving Day Parade!", imageName: "biography4"),
//        BookReview(title: "I dissent: Ruth Bader Ginsburg Makes Her Mark", description: "Supreme Court justice Ruth Bader Ginsburg has spent a lifetime disagreeing: disagreeing with inequality, arguing against unfair treatment, and standing up for what’s right for people everywhere. This biographical picture book about the Notorious RBG, tells the justice’s story through the lens of her many famous dissents, or disagreements.", imageName: "biography5"),
//        BookReview(title: "Caesar Pizza", description: "In a jar with tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill. \nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon. \nShake dressing; pour over salad and toss. Add croutons and serve immediately.", imageName: "salad5"),
//        BookReview(title: "Garden Salad", description: "In a jar with tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill. \nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon. \nShake dressing; pour over salad and toss. Add croutons and serve immediately.", imageName: "salad6"),
//        BookReview(title: "Cobb Salad", description: "In a jar with tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill. \nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon. \nShake dressing; pour over salad and toss. Add croutons and serve immediately.", imageName: "salad0"),
//        BookReview(title: "Salmon Salad", description: "In a jar with tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill. \nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon. \nShake dressing; pour over salad and toss. Add croutons and serve immediately.", imageName: "salad1")
//    ]
//
//    let poetry = [
//        BookReview(title: "Oh the places you'll go!", description: "For out-starting upstarts of all ages, here is a wonderfully wise and blessedly brief graduation speech from the one and only Dr. Seuss. In his inimitable, humorous verse and pictures, he addresses the Great Balancing Act (life itself, and the ups and downs it presents) while encouraging us to find the success that lies within us.", imageName: "poetry1"),
//        BookReview(title: "Love that dog", description: "Jack hates poetry. Only girls write it and every time he tries to, his brain feels empty. But his teacher, Ms. Stretchberry, won't stop giving her class poetry assignments -- and Jack can't avoid them. But then something amazing happens. The more he writes, the more he learns he does have something to say.", imageName: "poetry2"),
//        BookReview(title: "A Beautiful Day in the Neighborhood", description: "A Beautiful Day in the Neighborhood reimagines the songs from the show as poetry, ranging from the iconic to the forgotten gems. The poem are funny, sweet, silly, and sincere, dealing with topics of difficult feelings, new siblings, everyday routines, imagination, and more. Perfect for bedtime, sing-along, or quiet time, this book of nostalgic and meaningful poetry is the perfect gift for every child.", imageName: "poetry3"),
//        BookReview(title: "Falling up", description: "Poor Screamin' Millie is just one of the unforgettable characters in this wondrous new book of poems and drawings by the creator of Where the Sidewalk Ends and A Light in the Attic. Here you will also meet Allison Beals and her twenty-five eels; Danny O'Dare, the dancin' bear; the Human Balloon; and Headphone Harold.", imageName: "poetry4"),
//        BookReview(title: "Alligator Pie", description: "A slice of Alligator Pie—sized for little ones! One of the best loved Canadian poems of all time, “Alligator Pie” established Dennis Lee’s reputation as “Canada’s Father Goose” when it appeared in his classic poetry collection of the same name in 1974. Now Lee's timeless rhyme is paired with striking artwork by Sandy Nichols, winner of a nationwide competition to find the perfect illustrator for the iconic poem.", imageName: "poetry5"),
//        BookReview(title: "Falling up", description: "Toast the bread in a toaster, or under a broiler on both sides. Cut the lettuce leaves in half crosswise and form into 8 neat stacks. \nTo make a double-decker club: On a clean work surface, arrange 3 bread slices in a row. Spread 1 tablespoon mayonnaise over 1 side of each bread slice. Place a lettuce stack on top of the first bread slice, top with 2 tomato slices, and season with salt and pepper, to taste.", imageName: "sandwich5"),
//        BookReview(title: "Club Sandwich", description: "Toast the bread in a toaster, or under a broiler on both sides. Cut the lettuce leaves in half crosswise and form into 8 neat stacks. \nTo make a double-decker club: On a clean work surface, arrange 3 bread slices in a row. Spread 1 tablespoon mayonnaise over 1 side of each bread slice. Place a lettuce stack on top of the first bread slice, top with 2 tomato slices, and season with salt and pepper, to taste.", imageName: "sandwich6"),
//    ]
//
//    func getBookReview(forCategoryTitle title:String) -> [BookReview] {
//        switch title {
//        case "Fiction":
//            return fiction
//        case "Fantasy":
//            return fantasy
//        case "Non-fiction":
//            return nonFiction
//        case "Biography":
//            return biography
//        case "Poetry":
//            return poetry
//        default:
//            return fiction
//        }
//    }
//}
