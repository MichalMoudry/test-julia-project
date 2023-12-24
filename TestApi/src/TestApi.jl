module TestApi
using HTTP, Sockets

health(req::HTTP.Request) = HTTP.Response(204)

greet() = println("Hello from a test web api!")

const ROUTER = HTTP.Router()

function main()
    greet()
    HTTP.register!(ROUTER, "GET", "/health", health)
    HTTP.serve(ROUTER, Sockets.localhost, 8080) # TODO: Add graceful shutdown
end

end # module TestApi
