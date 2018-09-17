# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 categories =
  [
    # Category Name, FA Icon
    ['Movies', "ticket"],
    ['TV Shows', "tv"],
    ['Music', "music" ],
    ['Music Videos', "video-camera"],
    ['Concerts & Festivals', "location-arrow" ],
    ['Podcasts', "headphones"],
    ['eBooks', "book"]
  ]

 tags = [
   'comedy, horror, thriller',
   'crazy, super, awesome',
   '80s, oldschool, techno',
   'wtf, edm, comedy',
   'educational, oldschool, comedy',
   'free, super, awesome',
   'basic, ordinary, wealth',
   'celebs, puffy, grapes',
   'names, bubbles, rick',
   'sanchez, tacos, oops'
 ]

posts = ["Don't leave home without trying this!", "The top 10 rated movies of 2018", "Michael Jordan is missing 4 left toes", "A lot of junk up in the trunk", "Cheese fountains are the newest trend", "Fake News, and How to Tell the Truth", "Bill Gates is Pregnant?!", "Holy Cow, The Pop is Dead", "Michael Jackson Rises from Hell", "Bill and Teds STD", "How to Bake a knife in a Cake"]

post_body = "<p>So the first thing you do when you start a blog is just start typing... You type and you type and you type, until you just can't type anymore.</p>
<p>The same goes when you're just trying to create random sample sentences. I am basically just typing who-hah to make sure the fonts are actually readable when I go to publish the entire website.</p>
<p>So yeah, my name is Sal and that's about all you need to know. Try to keep paragraphs to about two to three sentences, so the reader is able to read without straining their eyes too much. Reading on a computer can get really tiring!</p><p>So the first thing you do when you start a blog is just start typing... You type and you type and you type, until you just can't type anymore.</p>
<p>The same goes when you're just trying to create random sample sentences. I am basically just typing who-hah to make sure the fonts are actually readable when I go to publish the entire website.</p>
<p>So yeah, my name is Sal and that's about all you need to know. Try to keep paragraphs to about two to three sentences, so the reader is able to read without straining their eyes too much. Reading on a computer can get really tiring!</p>"


categories.each_with_index do |cat, cat_index|
  x = Category.new(name: cat[0], icon: cat[1] )
  x.image.attach(io: File.open('app/assets/images' + '/cat.jpg'), filename: 'cat.jpg', content_type: 'image/jpg')
  x.save!

  posts.each_with_index do |post, index|
    y = Post.new(title: "#{post} - #{x.name}", body: post_body, category_id: x.id, page_count: index * 5, active: true, activation_date: Time.now, tag_list: tags[cat_index], summary: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    y.save!
  end
end





Post.all.each_with_index do |post, index|
  post.main_image.attach(io: File.open('app/assets/images' + "/stock-image-#{(index%14)+1}.jpg"), filename: "/stock-image-#{(index%14)+1}.jpg", content_type: 'image/jpg')
end
