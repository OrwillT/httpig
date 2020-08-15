package main
import (
	"flag"
	"net/http"

	"./spa"
)

var SERVER_PORT = flag.String("p", "8080", "Specify the port to use for the server.")
var BASE_URL = flag.String("b", "/", "Specify the base URL.")
var INDEX_PATH = flag.String("i", ".", "Specify the index path.")

func main() {
	flag.Parse()
	http.Handle(*BASE_URL, spa.Handler(*INDEX_PATH, "index.html"))
	http.ListenAndServe(":" + *SERVER_PORT, nil)
}