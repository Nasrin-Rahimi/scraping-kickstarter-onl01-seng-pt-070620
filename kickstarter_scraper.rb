require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  project =  kickstarter.css("li.project.grid_4").first
  title = project.css("h2.bbcard_name strong a").text
  image_link = project.css(".projectphoto-little")
  binding.pry
  
  # projects : kickstarter.css("li.project.grid_4")
  # title: project.css("h2.bbcard_name strong a").text
end