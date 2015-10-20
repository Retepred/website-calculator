require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?

get '/' do
  erb :home
end

get '/about_calculator' do
  erb :about_calculator
end

get '/super_calculator' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = case @operator
    when '+'
      @first_number + @second_number
    when '-'
      @first_number - @second_number
    when "*"
      @first_number * @second_number
    when "/"
      @first_number / @second_number
    when "**"
      @first_number ** @second_number
    when "√"
      Math::sqrt(@first_number)
  end

  erb :result
end

get '/volumes' do
  @radius_number = params[:radius_number].to_f
  @height_number = params[:height_number].to_f
  @shape = params[:shape]

  @volumes = case @shape
    when 'cylinder'
      Math::PI * @radius_number ** 2 * @height_number
    when 'cone'
      Math::PI * @radius_number ** 2 * @height_number / 3
    end

  erb :volumes
end

get '/hotness_calculator' do
  @street_looking = params[:street_looking].to_f

  @hotness_calculator = @street_looking

erb :hotness_calculator
end  

get '/multiply/:x/:y' do
  @result = params[:x].to_i * params[:y].to_i
  erb :result
end