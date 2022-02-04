package main

import (
	"log"
	"net/http"
)

func setCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
	(*w).Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
}

func Translator() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		setCors(&w)

		http.FileServer(http.Dir("/website")).ServeHTTP(w, r)

	}
}

func main() {

	http.Handle("/", Translator())
	log.Println("Listening...")
	log.Fatal(http.ListenAndServe(":3000", nil))
}
