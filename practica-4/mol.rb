require 'sinatra'


get '/' do
    value = rand(1..42)
    if value < 42
        status 404
        body "error 404 valor:#{value}"
    else
        status 200
        body '<img src=https://i.ytimg.com/vi/h3uBr0CCm58/hqdefault.jpg>'
    end
end