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
    rank=Rank.where(PersonID: params[:person_id]).includes(:page)

    @stat = rank.inject(0){|sum,i| sum+i.Rank if i.page.SiteID == params[:site_id]}


    if params.include? :date

      if Date.parse(params[:date][:first]) < Date.parse(params[:date][:second])
        date_begin=Date.parse(params[:date][:first])
        date_end=Date.parse(params[:date][:second])
      else
        date_begin=Date.parse(params[:date][:second])
        date_end=Date.parse(params[:date][:first])
      end

      @stat = rank.inject(0){|sum,i| sum+i.Rank if i.page.SiteID == params[:site_id] && i.page.FoundDateTime>date_begin && i.page.FoundDateTime<date_end}
    end

    @persons = Person.all
    @sites = Site.all
    
  end


end
