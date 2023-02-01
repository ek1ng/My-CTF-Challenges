package product

import (
	"GopherShop/internal/db"
	"github.com/gin-gonic/gin"
)

func GetProductList(context *gin.Context) {
	list, err := db.GetProductList()
	if err != nil {
		context.JSON(500, gin.H{"error": "get product list error"})
		return
	}
	context.JSON(200, gin.H{"productList": list})
}
