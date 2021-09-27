func createPost() -> Post{
    guard let randomAuthor = authors.randomElement() else { return Post(avatar: "", author: "", photo: "", post: "", shortText: "") }
    guard let randomPhoto = photos.randomElement() else { return Post(avatar: "", author: "", photo: "", post: "", shortText: "") }
    guard let randomAvatar = photos.randomElement() else { return Post(avatar: "", author: "", photo: "", post: "", shortText: "") }
    guard let randomPostText = posts.randomElement() else { return Post(avatar: "", author: "", photo: "", post: "", shortText: "") }
    var shortPostText: String
    
    if randomPostText.count > 50{
        shortPostText = String(randomPostText.dropLast(randomPostText.count - 50)) + "..."
    } else {
        shortPostText = randomPostText
    }
    
    return Post(avatar: randomAvatar, author: randomAuthor, photo: randomPhoto, post: randomPostText, shortText: shortPostText)
}


struct Post{
    var avatar: String
    var author: String
    var photo: String
    var post: String
    var shortText: String
}
