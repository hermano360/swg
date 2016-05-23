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
