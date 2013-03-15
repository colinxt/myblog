namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_posts
  end
end

def make_posts
  5.times do
    title = "test"
    content = Faker::Lorem.paragraphs(paragraph_count=3)
    public = true
    Post.create(title: title, content: content, public: public)
  end
end
