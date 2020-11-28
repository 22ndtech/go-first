package handlers

import (
	"log"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
	"jaackdreality.com/go-first/data"
)

type Products struct {
	l *log.Logger
}

func NewProducts(l *log.Logger) *Products {
	return &Products{l}
}

func (p *Products) GetProducts(w http.ResponseWriter, r *http.Request) {
	p.l.Println("Starting handlers.Products.getProducts")
	lp := data.GetProducts()
	err := lp.ToJSON(w)
	if err != nil {
		http.Error(w, "unable to marshal json", http.StatusInternalServerError)
		return
	}
}

func (p *Products) extractProduct(r *http.Request) (data.Product, error) {
	prod := data.Product{}
	err := prod.FromJSON(r.Body)

	return prod, err
}

func (p *Products) PostProduct(w http.ResponseWriter, r *http.Request) {
	p.l.Println("Starting handlers.Products.postProduct")

	prod, err := p.extractProduct(r)

	if err != nil {
		http.Error(w, "Unable to parse product from request body", http.StatusBadRequest)
	}

	p.l.Printf("Prod: %#v", prod)
	data.AddProduct(&prod)
}

func (p *Products) PutProduct(w http.ResponseWriter, r *http.Request) {
	p.l.Println("Starting handlers.Products.putProduct")

	vars := mux.Vars(r)
	idStr := vars["id"]
	id, _ := strconv.Atoi(idStr)
	prod, err := p.extractProduct(r)

	p.l.Println("got id", id)

	err = data.UpdateProduct(id, &prod)
	if err == data.ErrProductNotFound {
		http.Error(w, "Product not found", http.StatusNotFound)
		return
	}

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

}
