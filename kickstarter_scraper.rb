require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  
  projects_list = kickstarter.css("li.project.grid_4")
  projects_list.each do |project|
    title = project.css("h2.bbcard_name strong a").text
    image_link = project.css("div.project-thumbnail a img").attribute("src").value
    description = project.css("p.bbcard_blurb").text
    location = project.css(".location-name").text
    percent_funded = project.css("ul.project-stats li.first.funded strong").text
    
     projects[title.to_sym] = {:imge_link => image_link, :description => description, :location => location, :percent_funded => percent_funded}
  
  end
  
  projects
 
end