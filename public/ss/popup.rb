

get '/uh' do
	p "does this shit work?"
	redirect '/popup'
end


get '/popup'
	erb :popup
	
end
