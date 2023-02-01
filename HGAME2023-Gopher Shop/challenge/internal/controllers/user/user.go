package user

import (
	"GopherShop/internal/config"
	"GopherShop/internal/db"
	"GopherShop/internal/utils"
	"github.com/gin-gonic/gin"
	"strconv"
)

func GetUserInfo(context *gin.Context) {
	username, _ := context.Get("username")

	user, err := db.GetUserByUsername(username.(string))
	if err != nil {
		context.JSON(500, gin.H{"error": "get user info error"})
		return
	}

	context.JSON(200, gin.H{"inventory": user.Inventory, "days": user.Days, "balance": user.Balance})

}

func BuyProduct(context *gin.Context) {
	username, _ := context.Get("username")

	user, err := db.GetUserByUsername(username.(string))
	if err != nil {
		return
	}
	product := context.Query("product")
	price, err := db.GetProductPrice(product)
	number, err := strconv.Atoi(context.Query("number"))

	//校验是否买的起
	if err != nil || number < 1 || user.Balance < uint(number)*price {
		context.JSON(400, gin.H{"error": "invalid request"})
		return
	}

	user.Days -= 1
	user.Inventory -= uint(number)
	user.Balance -= uint(number) * price

	//扣除库存和余额
	err = db.UpdateUserInfo(user)

	if err != nil {
		context.JSON(500, gin.H{"error": "delete balance and inventory error"})
		return
	}

	err = db.AddOrder(username.(string), product, uint(number), true)

	if err != nil {
		context.JSON(500, gin.H{"error": "add order error"})
		return
	}

	context.JSON(200, gin.H{"message": "success"})
}

func SellProduct(context *gin.Context) {
	username, _ := context.Get("username")

	user, err := db.GetUserByUsername(username.(string))
	if err != nil {
		return
	}
	product := context.Query("product")
	price, err := db.GetProductPrice(product)
	number, err := strconv.Atoi(context.Query("number"))
	sum, err := utils.GetOrderSum(username.(string))
	_, exist := sum[product]
	if !exist {
		sum[product] = 0
	}

	//校验是否卖的出
	if err != nil || number < 1 || sum[product] == 0 || uint(number) > sum[product] {
		context.JSON(400, gin.H{"error": "invalid request"})
		return
	}

	user.Days -= 1
	user.Inventory += uint(number)
	user.Balance += uint(number) * price
	err = db.UpdateUserInfo(user)

	if err != nil {
		context.JSON(500, gin.H{"error": "add balance and inventory error"})
		return
	}

	err = db.AddOrder(username.(string), product, uint(number), false)
	if err != nil {
		context.JSON(500, gin.H{"error": "add order error"})
		return
	}

	context.JSON(200, gin.H{"message": "success"})

}

func BuyInventory(context *gin.Context) {
	username, _ := context.Get("username")

	user, err := db.GetUserByUsername(username.(string))
	if err != nil || user.Balance < 5 {
		context.JSON(500, gin.H{"error": "buy inventory error"})
		return
	}
	user.Days -= 1
	user.Inventory += 1
	user.Balance -= 5
	err = db.UpdateUserInfo(user)

	if err != nil {
		return
	}
	context.JSON(200, gin.H{"message": "success"})
}

func GetOrderSum(context *gin.Context) {
	username, _ := context.Get("username")
	sum, err := utils.GetOrderSum(username.(string))
	if err != nil {
		context.JSON(500, gin.H{"error": "get order sum error"})
		return
	}
	context.JSON(200, gin.H{"orderSum": sum})
}

func Tanking(context *gin.Context) {
	username, _ := context.Get("username")

	user, err := db.GetUserByUsername(username.(string))
	if err != nil {
		return
	}

	user.Days -= 1

	// Days -1
	err = db.UpdateUserInfo(user)

	if err != nil {
		context.JSON(500, gin.H{"error": "tanking error"})
		return
	}
	context.JSON(200, gin.H{"message": "success"})
}

func CheckFlag(context *gin.Context) {
	username, _ := context.Get("username")

	//查询是否购买过flag
	sum, err := utils.GetOrderSum(username.(string))
	if err != nil {
		return
	}

	_, exist := sum["Flag"]

	if !exist {
		context.JSON(500, gin.H{"error": "check flag error"})
		return
	}

	context.JSON(200, gin.H{"message": config.Secret.Flag})
}
