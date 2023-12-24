module TestApi
using HTTP, JSON3, Sockets

greet() = print("Hello World!")

function health()
    return HTTP.Response(204)
end

function main()
    const ROUTER = HTTP.Router()
    HTTP.register!(ROUTER, "GET", "/health", health)
    HTTP.serve!(ROUTER, Sockets.localhost, 8080)
end

end # module TestApi
