class Crawler
  def Crawler.hackathon
    agent = Mechanize.new
    url = "https://vi.wikipedia.org/wiki/Wikipedia:Ngày_này_năm_xưa"
    months = ("01".."12")
    days = ("01".."31")
    months.each do |month|
      days.each do |day|
        page_url =  "#{url}/#{month}/#{day}"
        page = agent.get(page_url) rescue break
        contents = page.at("#mw-content-text")
        main_event = contents.at("p").text
        History.create day_month: "#{day}/#{month}", year: nil , content: main_event, main_event: true
        contents.search("li").each do |event|
          year = event.at("a").text rescue ""
          content = event.text
          History.create day_month: "#{day}/#{month}", year: year , content: content, main_event: false
        end
        # l = page.at("#mw-content-text > .show-image").at("a")
        # link = Mechanize::Page::Link.new(l, agent, page)
        # link.click.images.second.fetch.save_as("#{day}_#{month}.png") rescue "Failed!"
      end
    end
  end
end