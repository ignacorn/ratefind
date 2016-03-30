class InterfaceController < ApplicationController
  def user
  	# @article={}
  end

  def admin
  	@par=params
  end

  def result
  	params[:person_name]
  end
end
