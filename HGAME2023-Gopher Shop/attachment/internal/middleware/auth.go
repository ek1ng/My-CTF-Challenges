package middleware

import (
	"GopherShop/internal/db"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func Auth() gin.HandlerFunc {
	return func(context *gin.Context) {
		session := sessions.Default(context)
		username, exist := session.Get("username").(string)
		if exist == false {
			context.JSON(401, gin.H{
				"error": "invalid session",
			})
			context.Abort()
		}
		User, err := db.GetUserByUsername(username)
		if err != nil {
			return
		}

		if User.Days <= 0 {
			context.JSON(200, gin.H{
				"message": username + " have no days left!",
			})
			context.Abort()
		}

		context.Set("username", username)
		context.Next()
	}
}
