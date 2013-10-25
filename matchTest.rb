# -*- encoding: utf-8 -*-

count = 0

File.open("tag.txt", "r:utf-8") do |tags|
	tags.each do |tag|
		tag.chomp!
		char_tags = tag.split(//)
	
		
		File.open("title.txt", "r:utf-8") do |titles|
			titles.each do |title|
				title.chomp!
				char_titles = title.split(//)
				
				char_tags.each do |char_tag|
				
					char_titles.each do |char_title|
						if char_tag == char_title
							count += 1
							break
						end
					end
					
				end
			
				matchRate = count.quo(char_tags.size) * 100
				
				puts("#{count}, #{char_tags.length}, #{matchRate}, #{title}, #{tag}")
				
				if matchRate == 100
					File.open("tag_title_100.txt", "a:utf-8") do |file|
						file.puts("#{title}, #{tag}")
					end
				elsif matchRate >= 80 && matchRate < 100
					File.open("tag_title_80.txt", "a:utf-8") do |file|
						file.puts("#{matchRate}, #{title}, #{tag}")
					end
				elsif matchRate >= 60 && matchRate < 80
					File.open("tag_title_60.txt", "a:utf-8") do |file|
						file.puts("#{matchRate}, #{title}, #{tag}")
					end
				else
					File.open("tag_title_0.txt", "a:utf-8") do |file|
						file.puts("#{count}, #{char_tags.length}, #{title}, #{tag}")
					end
				end
				
				count = 0
			end
		end
	end
end