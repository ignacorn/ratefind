class InterfaceController < ApplicationController

	
  def user
  	# @article={}
  end

  def admin
  	@par=params
  end

  def result
  	
  

    @result = Processor.parse_params params


  	@persons = Person.all
    @keywords = Keyword.all
    @sites = Site.all
  
  end


  def stat
    @stat = rand(0..100)
    if params.include? :date
      @f=Date.parse(params[:date][:first])
      @s=Date.parse(params[:date][:second])
    end

    @persons = Person.all
    @sites = Site.all
    
  end


end
