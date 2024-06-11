enum QuizCategory {
  generalKnowledge,
  entertainmentBooks,
  entertainmentFilm,
  entertainmentMusic,
  entertainmentMusicalsAndTheatres,
  entertainmentTelevision,
  entertainmentVideoGames,
  entertainmentBoardGames,
  scienceNature,
  scienceComputers,
  scienceMathematics,
  mythology,
  sports,
  geography,
  history,
  politics,
  art,
  celebrities,
  animals,
  vehicles,
  entertainmentComics,
  scienceGadgets,
  entertainmentJapaneseAnimeManga,
  entertainmentCartoonAnimations,
  ;

  String get name => switch (this) {
        generalKnowledge => 'General Knowledge',
        entertainmentBooks => 'Entertainment: Books',
        entertainmentFilm => 'Entertainment: Film',
        entertainmentMusic => 'Entertainment: Music',
        entertainmentMusicalsAndTheatres => 'Entertainment: Musicals & Theatres',
        entertainmentTelevision => 'Entertainment: Television',
        entertainmentVideoGames => 'Entertainment: Video Games',
        entertainmentBoardGames => 'Entertainment: Board Games',
        scienceNature => 'Science: Nature',
        scienceComputers => 'Science: Computers',
        scienceMathematics => 'Science: Mathematics',
        mythology => 'Mythology',
        sports => 'Sports',
        geography => 'Geography',
        history => 'History',
        politics => 'Politics',
        art => 'Art',
        celebrities => 'Celebrities',
        animals => 'Animals',
        vehicles => 'Vehicles',
        entertainmentComics => 'Entertainment: Comics',
        scienceGadgets => 'Science: Gadgets',
        entertainmentJapaneseAnimeManga => 'Entertainment: Japanese Anime & Manga',
        entertainmentCartoonAnimations => 'Entertainment: Cartoon & Animations',
      };

  String get imageUrl => switch (this) {
        generalKnowledge =>
          'https://images.unsplash.com/photo-1522211988038-6fcbb8c12c7e?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentBooks =>
          'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentFilm =>
          'https://images.unsplash.com/photo-1606612658492-f479525ae94c?q=80&w=3573&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentMusic =>
          'https://images.unsplash.com/photo-1507838153414-b4b713384a76?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentMusicalsAndTheatres =>
          'https://plus.unsplash.com/premium_photo-1684923603988-eac02cb84a6a?q=80&w=3571&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentTelevision =>
          'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentVideoGames =>
          'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentBoardGames =>
          'https://images.unsplash.com/photo-1629760946220-5693ee4c46ac?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        scienceNature =>
          'https://images.unsplash.com/photo-1621403559751-f5096a808c54?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        scienceComputers =>
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        scienceMathematics =>
          'https://images.unsplash.com/photo-1635372722656-389f87a941b7?q=80&w=3731&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        mythology =>
          'https://images.unsplash.com/photo-1621036340854-542edfdcdcd4?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        sports =>
          'https://images.unsplash.com/photo-1471295253337-3ceaaedca402?q=80&w=2992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        geography =>
          'https://images.unsplash.com/photo-1521295121783-8a321d551ad2?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        history =>
          'https://plus.unsplash.com/premium_photo-1661963996750-24c93354eecc?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        politics =>
          'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?q=80&w=3600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        art =>
          'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?q=80&w=3566&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        celebrities =>
          'https://images.unsplash.com/photo-1590457322136-5380536935fa?q=80&w=3569&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        animals =>
          'https://images.unsplash.com/photo-1589656966895-2f33e7653819?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        vehicles =>
          'https://images.unsplash.com/photo-1508798179027-a00aa5326443?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentComics =>
          'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        scienceGadgets =>
          'https://images.unsplash.com/photo-1602526432604-029a709e131c?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentJapaneseAnimeManga =>
          'https://images.unsplash.com/photo-1709675577966-6231e5a2ac43?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        entertainmentCartoonAnimations =>
          'https://images.unsplash.com/photo-1582128003011-717e3203f590?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      };

  int get number => switch (this) {
        generalKnowledge => 9,
        entertainmentBooks => 10,
        entertainmentFilm => 11,
        entertainmentMusic => 12,
        entertainmentMusicalsAndTheatres => 13,
        entertainmentTelevision => 14,
        entertainmentVideoGames => 15,
        entertainmentBoardGames => 16,
        scienceNature => 17,
        scienceComputers => 18,
        scienceMathematics => 19,
        mythology => 20,
        sports => 21,
        geography => 22,
        history => 23,
        politics => 24,
        art => 25,
        celebrities => 26,
        animals => 27,
        vehicles => 28,
        entertainmentComics => 29,
        scienceGadgets => 30,
        entertainmentJapaneseAnimeManga => 31,
        entertainmentCartoonAnimations => 32,
      };
}
