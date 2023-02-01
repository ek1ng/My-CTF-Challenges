package auth

import (
	"GopherShop/internal/db"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func Register(context *gin.Context) {
	request := struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}{}
	if err := context.ShouldBindJSON(&request); err != nil {
		context.JSON(400, gin.H{
			"error": "invalid request",
		})
		return
	}

	err := db.CreateUser(&db.User{
		Username:  request.Username,
		Password:  request.Password,
		Days:      28,
		Inventory: 20,
		Balance:   10,
	})

	if err != nil {
		context.JSON(500, gin.H{
			"error": "create user error",
		})
		return
	}
	context.JSON(200, gin.H{"message": "success"})
}

func Login(context *gin.Context) {
	request := struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}{}

	if err := context.ShouldBindJSON(&request); err != nil {
		context.JSON(400, gin.H{
			"error": "invalid request",
		})
		return
	}

	user, err := db.GetUserByUsername(request.Username)
	if err != nil {
		context.JSON(400, gin.H{
			"error": "invalid username",
		})
		return
	}

	if user.Password != request.Password {
		context.JSON(400, gin.H{
			"error": "invalid password",
		})
		return
	}

	if user.Days <= 0 {
		context.JSON(200, gin.H{
			"message": user.Username + " have no days left!",
		})
		return
	}

	session := sessions.Default(context)
	session.Set("username", user.Username)
	err = session.Save()
	if err != nil {
		return
	}
	context.JSON(200, gin.H{"message": "success"})
}
