class Crawler
  def Crawler.hackathon
    agent = Mechanize.new
    url = "https://vi.wikipedia.org/wiki/Wikipedia:Ngày_này_năm_xưa"
    months = ("01".."12")
    days = ("01".."31")
    puts "_________Delete all history records_________"
    History.destroy_all
    puts "_________Done!_________"
    History.transaction do
      months.each do |month|
        days.each do |day|
          puts "_________#{day}/#{month}________"
          page_url =  "#{url}/#{month}/#{day}"
          page = agent.get(page_url) rescue next
          contents = page.at("#mw-content-text")
          contents.at("p > b").remove rescue Exception
          main_event = contents.at("p").text rescue Exception
          main_event.slice!(0)
          History.create day_month: "#{day}/#{month}", year: nil , content: main_event.strip, main_event: true
          contents.search("li").each do |event|
            year = event.at("a").text rescue Exception
            event.at("a").remove rescue Exception
            content = event.text rescue Exception
            content.slice!(1)
            History.create day_month: "#{day}/#{month}", year: year , content: content.strip, main_event: false
          end rescue next
        end
      end
    end
    puts "_________Finished!_________"
  end
end