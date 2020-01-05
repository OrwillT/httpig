package main
import (
	"net/http"

	"github.com/OrwillT/httpig/spa"
)

func main() {
http.Handle("/", spa.Handler("/static", "index.html"))
	http.ListenAndServe(":8080", nil)
}
