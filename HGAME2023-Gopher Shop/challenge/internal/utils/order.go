package utils

import (
	"GopherShop/internal/db"
)

func GetOrderSum(username string) (map[string]uint, error) {
	order, err := db.GetOrder(username)

	if err != nil {
		return nil, err
	}

	var sum = map[string]uint{}

	for _, i := range order {
		//判断sum是否存在i.Product属性，不存在则添加此属性
		_, exist := sum[i.Product]
		if !exist {
			sum[i.Product] = 0
		}

		if !i.Status {
			sum[i.Product] -= i.Number
		} else {
			sum[i.Product] += i.Number
		}
	}

	// 删除sum中value为0的属性
	for k, v := range sum {
		if v == 0 {
			delete(sum, k)
		}
	}

	return sum, nil
}
