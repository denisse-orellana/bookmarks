# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = ['Video', 'Article', 'Paper', 'Blog', 'Newspaper']
    types.each do |type|
        Type.create!(
            name: type
        )
    end

categories = ['Animals', 'Cience', 'Literature', 'Tecnology']
    categories.each do |category|
        Category.create!(
            name: category,
            visibility: [true, false].sample
        )
    end

subcategories_1 = ['Birds', 'Mammals', 'Fish', 'Reptiles', 'Amphibians']
    subcategories_1.each do |subcategory|
        Category.create!(
            name: subcategory,
            category_id: 1
        )
    end

subcategories_2 = ['Geology', 'Oceanology', 'Physics', 'Astronomy', 'Botany']
    subcategories_2.each do |subcategory|
        Category.create!(
            name: subcategory,
            category_id: 2
        )
    end

20.times do 
    Bookmark.create!(
        title: Faker::TvShows::RickAndMorty.quote, 
        url: Faker::Internet.url, 
        type_id: rand(Type.first.id..Type.last.id),
        category_id: rand(Category.first.id..Category.last.id)
    )
end