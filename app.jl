using Genie, Genie.Router, Genie.Renderer.Html
route("/") do
    username = ENV["USERNAME"]
    io = IOBuffer()
    run(pipeline(`squeue -u $username`, stdout=io), wait=true)
    h1(String(take!(io)))
end
up() # start the server
