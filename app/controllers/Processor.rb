module Processor

	def self.tester
		@tester = "works!"
	end

	def self.parse_params params

		@params = params
		@result={}

		@source = "person" if params.include? :person_name
		@source = "keyword" if params.include? :keyword
		@source = "site" if params.include? :site
	
		@result[:flag] = @source 

		case params[:commit]
			when 'Добавить'
				add @source
			when 'Изменить'
				edit @source
			when 'Удалить'
				delete @source
		end


		@result
	end

	private



	def self.add par

		case par

			when "person"

				person_name=@params[:person_name].mb_chars.downcase.capitalize.to_s
		    @result[:message_text]= "Добавлена личность: "
		    if Person.find_by(name: person_name).nil?
		      Person.create(name: person_name) unless person_name.empty?
		      person_name.empty? ? @result[:message_text] = "Имя не указано!" : @result[:message_text] << person_name
		    else
		      @result[:message_text] = "Личность уже существует в базе!"
		    end

			when "keyword"

		    keyword_name=@params[:keyword].mb_chars.downcase.capitalize.to_s
		    id=Person.find(@params[:person_id])
		    @result[:message_text]= "Добавлено ключевое слово: "
		    if Keyword.find_by(name: keyword_name).nil?
		      Keyword.create(name: keyword_name, person: id) unless keyword_name.empty?
		      keyword_name.empty? ? @result[:message_text] = "Ключевое слово не указано!" : @result[:message_text] << keyword_name
		    else
		      @result[:message_text] = "Ключевое слово уже существует в базе!"
		    end

		  when "site"

		    site_name=@params[:site]
		    @result[:message_text]= "Добавлен сайт: "
		    if Site.find_by(name: site_name).nil?
		      Site.create(name: site_name) unless site_name.empty?
		      site_name.empty? ? @result[:message_text] = "Сайт не указан!" : @result[:message_text] << site_name
		    else
		      @result[:message_text] = "Сайт уже существует в базе!"
		    end
		  	
		    else

		    	@result[:message_text] = "Ошибка добавления!"
	
		end
		
	end



	def self.edit par

		case par

			when "person"

				person_id=@params[:person_id]
		    new_name=@params[:person_edit].mb_chars.downcase.capitalize.to_s
		    if Person.find_by(id: person_id).nil?
		      @result[:message_text] = "Личность отсутствует в базе!"
		    else  
		      new_name.empty? ? @result[:message_text] = "Новое имя не указано!" : @result[:message_text] = "Изменено имя: c #{Person.find(person_id).Name} на " << new_name
		      Person.find(person_id).update name: new_name unless new_name.empty?
	    	end

	  	when 'keyword'

		    keyword_id=@params[:keyword_id]
		    new_keyword=@params[:keyword_edit].mb_chars.downcase.capitalize.to_s
		    if Keyword.find_by(id: keyword_id).nil?
		      @result[:message_text] = "Ключевое слово отсутствует в базе!"
		    else
		      new_keyword.empty? ? @result[:message_text] = "Новое имя не указано!" : @result[:message_text] = "Изменено ключевое слово: c #{Keyword.find(keyword_id).Name} на " << new_keyword
		      Keyword.find(keyword_id).update(name: new_keyword) unless new_keyword.empty?
		    end

		  when 'site'

		    site_id=@params[:site_id]
		    new_site=@params[:site_edit]
		    if Site.find_by(id: site_id).nil?
		      @result[:message_text] = "Сайт отсутствует в базе!"
		    else
		      new_site.empty? ? @result[:message_text] = "Новый сайт не указан!" : @result[:message_text] = "Изменен сайт: c #{Site.find(site_id).Name} на " << new_site
		      Site.find(site_id).update Name: new_site unless new_site.empty?
		    end
		  	
			else

		    @result[:message_text] = "Ошибка изменения!"
	
				
		end

		
	end



	def self.delete par

		case par

			when 'person'

				person_id=@params[:person_id]
				@result[:message_text] = "Удалена личность: "
		    if Person.find_by(id: person_id).nil?
		      @result[:message_text] = "Личность отсутствует в базе!"
		    else
		      person_id.empty? ? @result[:message_text] = "Имя не указано!" : @result[:message_text] << Person.find(person_id).name
		      Person.find(person_id).destroy unless person_id.empty?
		    end

		  when 'keyword'

		  	keyword_id=params[:keyword_id]
				@result[:message_text] = "Удалено ключевое слово: "
		   	 if Keyword.find_by(id: keyword_id).nil?
		      keyword_id = "Ключевое слово отсутствует в базе!"
		    else
		      keyword_id.empty? ? @result[:message_text] = "Ключевое слово не указано!" : @result[:message_text] << Keyword.find(keyword_id).name
		      Keyword.find(keyword_id).destroy unless keyword_id.empty?
		    end

		   when 'site'

		   	site_id=params[:site_id]
				@result[:message_text] = "Удален сайт: "
		    if Site.find_by(id: site_id).nil?
		      @result[:message_text] = "Сайт отсутствует в базе!"
		    else
		     site_id.empty? ? @result[:message_text] = "Сайт не указан!" : @result[:message_text] << Site.find(site_id).name
		     Site.find(site_id).destroy unless site_id.empty?
		    end
				   	
			else

		    @result[:message_text] = "Ошибка удаления!"
	
			
		end

	end
	
end