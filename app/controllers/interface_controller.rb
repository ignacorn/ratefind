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
    rank=Person.find(params[:person_id]).ranks

    @stat = rank.inject(0){|sum,i| sum+i.Rank}
    if params.include? :date
      @f=Date.parse(params[:date][:first])
      @s=Date.parse(params[:date][:second])
    end

    @persons = Person.all
    @sites = Site.all
    
  end


end
