require 'sinatra'

#middleare del punto 6

class NumberToX
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response  = @app.call(env)
    new_response = response.map { |c| c.gsub(/\d/,'x') }
    [status, headers, new_response]
  end
end

#middleware del punto 7

class LaCabezaLoca 
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response  = @app.call(env)
    headers['X-Xs-Count'] = response.to_s.count('x').to_s
    [status, headers, response]
  end
end


use NumberToX
use LaCabezaLoca



get '/' do
body "GET / lista todos los endpoints disponibles (sirve a modo de documentación) <br/>
GET /mcm/:a/:b calcula y presenta el mínimo común múltiplo de los valores numéricos :a y :b <br/>
GET /mcd/:a/:b calcula y presenta el máximo común divisor de los valores numéricos :a y :b <br/>
GET /sum/* calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el splat <br/>
GET /even/* presenta la cantidad de números pares que hay entre los valores numéricos recibidos como parámetro en el splat <br/>
POST /random presenta un número al azar <br/>
POST /random/:lower/:upper presenta un número al azar entre :lower y :upper (dos valores numéricos)"
end

get '/mcm/:a/:b' do
    status 200
    body "el mcm de #{params.values} es: #{params['a'].to_i.lcm(params['a'].to_i)}"
end

get '/mcd/:a/:b' do
    status 200
    body "el mcd de #{params.values} es: #{params['a'].to_i.gcd(params['a'].to_i)}"
end

get '/sum/*' do
    status 200
    body "la suma de los parametros:#{params['splat'][0].split("/")} 
    es: #{params['splat'][0].split("/").map {|each| each.to_i}.sum}"
end

get '/even/*' do
    status 200
    body "la cantidad de numeros pares es: #{params['splat'][0].split("/").filter {|x| !x.to_i.odd?}.size
    }"
end

post '/random' do
    status 200
    body "el numero random es: #{rand(1..100)}"
end

post '/random/:lower/:upper' do
  status 200
  body "el numero random es: #{rand(params['lower'].to_i..['upper'].to_i)}"
end
