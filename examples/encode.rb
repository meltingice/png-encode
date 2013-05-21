require './lib/png-encode'

PNG.encode("./examples/example.txt", "./examples/example.png")
PNG.decode("./examples/example.png", "./examples/example_decoded.txt")