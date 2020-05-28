require 'faker'

class EmailsController < ApplicationController


	def create
		@email = Email.new(object: Faker::GreekPhilosophers.quote, body: Faker::Hipster.paragraph(2, true, 4))
		@email.save
		respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
	end

	def show
		@email = Email.find(params[:id])
		@email.update(read: "true")
				respond_to do |format|
        format.html { }
        format.js { }
      end
	end


  def index
  	@emails = Email.all
  end

  def destroy
  		@email = Email.find(params[:id])
  		@email.destroy
			respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
  end

  def update
  		@email = Email.find(params[:id])
  		if @email.read == true 
  			@email.update(read: "false")
  		else 
				@email.update(read: "true")
			end
			
			respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end

  end

end
