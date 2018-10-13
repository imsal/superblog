Author.create(email_address: 'saltad347@gmail.com', name: 'sal', bio: 'blah', password: 'blah123', password_confirmation: 'blah123' )

categories = ['Entertainment', 'Lifestyle', 'Recipes', 'Educational']

sub_categories = [
  ['Music', 'Movies', 'TV Shows', 'Music Videos', 'Concerts', 'Podcasts'],
  ['Financial Planning', 'Home Organization', 'Work / Life Balance', 'Parenting', 'Budgetting', 'Health & Fitness', 'Instruments', 'Self Improvement'],
  ['Food', 'Alcohol'],
  ['Recommended Online Courses', 'Recommended Books', 'Recommended eBooks', 'DIY', 'LifeHacks']
]

categories.each_with_index do |cat, index|
  main_cat = Category.create(name: cat)

  sub_categories[index].each do |sub|
    Category.create(name: sub, parent_id: main_cat.id)
  end
end

post_body ="<h2>Chapter too parties its letters nor</h2>
<p>Certainly elsewhere my do allowance at. The address farther six hearted hundred towards husband. Are securing off occasion remember daughter replying. Held that feel his see own yet. Strangers ye to he sometimes propriety in. She right plate seven has. Bed who perceive judgment did marianne.</p>
<div class='image-holder' id='image-holder-1'></div>
<p>Shewing met parties gravity husband sex pleased. On to no kind do next feel held walk. Last own loud and knew give gay four. Sentiments motionless or principles preference excellence am. Literature surrounded insensible at indulgence or to admiration remarkably. Matter future lovers desire marked boy use. Chamber reached do he nothing be.</p>
<p>Put all speaking her delicate recurred possible. Set indulgence inquietude discretion insensible bed why announcing. Middleton fat two satisfied additions. So continued he or commanded household smallness delivered. Door poor on do walk in half. Roof his head the what.</p>
<p>We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now state. Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Of advantage he attending household at do perceived. Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.</p>
<p>Knowledge nay estimable questions repulsive daughters boy. Solicitude gay way unaffected expression for. His mistress ladyship required off horrible disposed rejoiced. Unpleasing pianoforte unreserved as oh he unpleasant no inquietude insipidity. Advantages can discretion possession add favourable cultivated admiration far. Why rather assure how esteem end hunted nearer and before. By an truth after heard going early given he. Charmed to it excited females whether at examine. Him abilities suffering may are yet dependent.</p>
<div class='image-holder' id='image-holder-2'></div>
<p>Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.</p>
<p>Do am he horrible distance marriage so although. Afraid assure square so happen mr an before. His many same been well can high that. Forfeited did law eagerness allowance improving assurance bed. Had saw put seven joy short first. Pronounce so enjoyment my resembled in forfeited sportsman. Which vexed did began son abode short may. Interested astonished he at cultivated or me. Nor brought one invited she produce her.</p>
<p>Do commanded an shameless we disposing do. Indulgence ten remarkably nor are impression out. Power is lived means oh every in we quiet. Remainder provision an in intention. Saw supported too joy promotion engrossed propriety. Me till like it sure no sons.</p>
<p>Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord.</p>"

# Category.all_sub_categories.each_with_index do |sub, index|

Category.last(1).each_with_index do |sub, index|

  12.times do |x|
    Post.create(title: "Random #{x} Title #{sub.name}", body: post_body, category_id: sub.id,
        active: true, activation_date: Time.now, tag_list: 'comedy, horror, thriller',
        summary: 'This is a random summary to type because I cant think of anything else to write', author_id: Author.last.id)
  end

end

# end

Post.all.each_with_index do |post, index|
  post.main_image.attach(io: File.open('app/assets/images/stock_images' + "/stock-image-#{(index%14)+1}.jpg"), filename: "/stock-image-#{(index%14)+1}.jpg", content_type: 'image/jpg')

  post.images.attach(io: File.open('app/assets/images/stock_images' + "/stock-image-#{(index%6)+1}.jpg"), filename: "/stock-image-#{(index%6)+1}.jpg", content_type: 'image/jpg')
  post.images.attach(io: File.open('app/assets/images/stock_images' + "/stock-image-#{(index%7)+1}.jpg"), filename: "/stock-image-#{(index%7)+1}.jpg", content_type: 'image/jpg')

end
