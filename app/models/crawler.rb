class Crawler
  def Crawler.hackathon
    agent = Mechanize.new
    url = "https://vi.wikipedia.org/wiki/Wikipedia:Ngày_này_năm_xưa"
    months = ("01".."12")
    days = ("01".."31")
    months.each do |month|
      days.each do |day|
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
end