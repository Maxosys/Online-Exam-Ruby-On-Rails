class StartController < ApplicationController

def starttest

			str = session[:current_user_id].to_s;


			@listOfAssignTest = TestAssignToStudent.all.select { |m| m.student_id.include? str }
			

			if params[:tid].present?

				# after click on start button or After Refresh page delete record

					@sql = "delete from test_result_qus_ans where test_id= '"+params[:tid]+"' and user_id = '"+str+"' ";

					@outputSql    = ActiveRecord::Base.connection.execute(@sql)

				# end delete

				 @online_test_name = OnlineTestName.find(params[:tid])

				 @test_questions_data = TestQuestion.where(:testid => params[:tid])  				 

			end
			
			#@skip_rightsidebar  =  TRUE
    		#@skip_leftsidebar   =  TRUE

end