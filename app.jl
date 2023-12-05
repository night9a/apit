using HTTP

# HTTP.listen! and HTTP.serve! are the non-blocking versions of HTTP.listen/HTTP.serve
server = HTTP.serve!() do request::HTTP.Request
   @show request
   @show request.method
   @show HTTP.header(request, "Content-Type")
   @show request.body
   try
       return HTTP.Response("Hello")
   catch e
       return HTTP.Response(400, "Error: $e")
   end
end
# HTTP.serve! returns an `HTTP.Server` object that we can close manually
close(server)
