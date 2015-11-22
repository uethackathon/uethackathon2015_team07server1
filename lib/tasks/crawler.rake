namespace :db do
  task crawl_data: :environment do
    Crawler.hackathon
  end
end