require 'csv'


class Justification_Letter
	def manual
		puts 'Who is the Southwest Engineer for this project? (First name)'
		@swg_engineer = gets.chomp

		puts 'What is the submission version letter? (a,b,c,d...)'
		@resubmission = gets.chomp.match(/[a-zA-Z]{1}/).to_s

		while resubmission == nil do
			puts 'Invalid response, please re-enter'
			@resubmission = gets.chomp.match(/[a-zA-Z]{1}/).to_s
		end

		puts 'What is the full name of the project? SIMP/201X .../Xxxx'
		full_project_name = gets.chomp.match(/(SIMP)\/(201[67] [A-Z]+)\/([A-Za-z0-9& ]+)/)
		#Maybe include more questions after 3rd attempt? New year? Simp typed correctly? etc.


		
		while full_project_name.nil? == true do
			puts 'Please type in the name exactly how it appears.'
			full_project_name = gets.chomp.match(/(SIMP)\/(201[67] [A-Za-z\s]+)\/([A-Za-z0-9& ]+)/)
		end



	end

	def initialize

	end

end


object = Justification_Letter.new
#puts object.manual


puts 'Who is the Southwest Engineer for this project? (First name)'
swg_engineer = gets.chomp


puts 'What is the submission version letter? (a,b,c,d...)'
resubmission = gets.chomp.match(/[a-zA-Z]{1}/).to_s

while resubmission == nil do
	puts 'Invalid response, please re-enter'
	resubmission = gets.chomp.match(/[a-zA-Z]{1}/)
end

puts 'What is the full name of the project? SIMP/201X .../Xxxx'
full_project_name = gets.chomp.match(/(SIMP)\/(201[67] [A-Z]+)\/([A-Za-z0-9& ]+)/)
#Maybe include more questions after 3rd attempt? New year? Simp typed correctly? etc.
while full_project_name.nil? == true do
	puts 'Please type in the name exactly how it appears.'
	full_project_name = gets.chomp.match(/(SIMP)\/(201[67] [A-Za-z\s]+)\/([A-Za-z0-9& ]+)/)
end

puts full_project_name[2]

puts 'What is the WR Number for this project?'
wr_number = gets.chomp.match(/[0-9]{7}/).to_s

while wr_number == nil do
	puts 'Invalid response for WR number, please re-enter.'
	wr_number = gets.chomp.match(/[0-9]{7}/).to_s

end

ensured_link = "https://ensured.enengineering.com/clients/SG/Shared\%20Documents/Forms/AllItems.aspx?RootFolder=\%2Fclients\%2FSG\%2FShared\%20Documents\%2F\%5FSWG\%20SCD\%20ENGINEERING%20PROJECTS&FolderCTID=0x012000E1BA8FEB7A1F864788CA71ACF18C4E13&View=\%7BF8FBAD1C\%2D2B03\%2D42FD\%2D998D\%2D4D10C19B62F7\%7D"

puts "Is this project using only open trench to install Mains?(yes,no)"
open_trench_answer = gets.chomp
streets_ot = []
street = ''
puts 'fail'
if open_trench_answer.upcase == 'YES'
	while street.upcase != 'END'
		puts 'Please type in each street that is open trenched one by one. Finish by typing "end".'
		street = gets.chomp
		if street.upcase != 'END'
			streets_ot.push(street)
		end
	end
end
puts 'fail2' + resubmission

re = ''
submissionx = '' 
if resubmission.upcase != 'A'
	puts resubmission
	re = 're'
	submissionx = ' Submission '+ resubmission
elsif resubmission.upcase == 'A'
	resubmission = ''

end

puts 'Please enter the full street name where there are 1/2" PVC replacements one by one.'
puts 'End by writing "end".'
pvc_replacement_street = ''
pvc_replacement_streets = []

while pvc_replacement_street.upcase != 'END' do
	pvc_replacement_street = gets.chomp
	pvc_replacement_streets.push(pvc_replacement_street)
end











#This is where the final string for document starts occuring


final_document =  "\nHello " + swg_engineer + ", \n\nI have uploaded the " 
final_document += re + 'submittal ' + full_project_name[0] 
final_document += " drawing package and report documents to the ENsured website, located under the project folder with the title \"WR "
final_document += wr_number + ' ' + full_project_name[1].to_s+full_project_name[2].to_s+' ' + full_project_name[3].upcase.to_s + submissionx.to_s
final_document += "\". I have provided the link to the project folder below.\n\n"+ensured_link
final_document += "\n\nBased on our field noting, EN Engineering has designed the proposed 2\" PE Main to be installed via "
if open_trench_answer.upcase == 'true'
	final_document += "open trench methods with a 3' offset from the current 2\" Main within the "
	final_document += "dirt shoulder running along "
end


streets_ot.each do |street_name|
	if (street_name != streets_ot.last and street_name != streets_ot.first)
		final_document += ", "
	elsif (street_name == streets_ot.last and streets_ot.length > 2)
		final_document += ", and "
	elsif (street_name == streets_ot.last and streets_ot.length == 2)
		final_document += " and "
	end
	final_document += street_name
end
final_document += ".  The main installation will only disturb asphalt when crossing residential streets "
final_document += " and private driveways.  Field bends will be utilized to"
final_document += " incorporate the 3' offset from the existing main. \n\n"
final_document += "The pavement quantities assigned to this project in Point\\Span 1 have been "
final_document += "calculated based on our field notes to provide the most accurate estimations possible.\n\n"

final_document += 'The streets are named : '

pvc_replacement_streets.each do |street_name|
	if (street_name != pvc_replacement_streets and street_name != pvc_replacement_streets.first)
		final_document += ", "
	elsif (street_name == pvc_replacement_streets.last and pvc_replacement_streets.length > 2)
		final_document += ", and "
	elsif (street_name == pvc_replacement_streets.last and pvc_replacement_streets.length == 2)
		final_document += " and "
	end
	final_document += street_name
end

puts final_document 


