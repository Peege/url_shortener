# require 'secure_random'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  url = Url.new
  url.full_url = params[:address]
  url.click_count = 0
  url.shortened_url = SecureRandom.hex(6)
  url.save
  erb :index
end

get '/:short_url' do
  url = Url.where(shortened_url: params[:short_url]).first
  url.click_count += 1
  url.save
  redirect to(url.full_url)
end
