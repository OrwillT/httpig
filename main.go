package main
import (
	"net/http"

	"github.com/OrwillT/httpig/spa"
)

func main() {
http.Handle("/", spa.Handler("/dist", "index.html"))
	http.ListenAndServe(":8080", nil)
}
