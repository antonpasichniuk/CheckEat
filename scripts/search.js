const URL = 'http://localhost:777/'
const sendRequest = (url) => {
	return fetch(url).then(response => {
		return response.json()
	})
}

const priceCalc = (price, markup, amount) => {
    return parseInt(price) / (100 + 
        ((parseInt(amount / 500) - markup) < 0 ? (parseInt(amount / 500) - markup) : 0 )) * 100
}

String.prototype.capitalize = function () {
	return this.charAt(0).toUpperCase() + this.slice(1);
}

function fillCategory(field, object) {
	object.then(object => {
		for (key in object) {
			field.innerHTML += `
			<label class="check_area">
				<input type="checkbox" class="check" value="${object[key].id}">
				<span class="check_box"></span>
				${object[key].name.capitalize()}
			</label>
			`
		}
	})
}

function checkName(name, condition){
	let isOk = new RegExp(condition, 'i')
	return isOk.test(name)
}

function fillContent(field, object, condition1 = '', condition2 = null) {
	const date = new Date()
	const holiday = sendRequest(URL + 'sales')
	object.then(product => {
		for (let key in product) {
			if ((condition1 == '' || checkName(product[key].name, condition1)) &&
				(condition2 == null || product[key].category_id == condition2)) { //Нужно изменить входные данные с idCategory на просто category 
				const category = sendRequest(categoryUrl + `/${product[key].category_id}`)
				category.then(category => {

					let img_keeper = product[key].img
					if (product[key].img == null) {
						img_keeper = 'img/img_keeper.png';
					}
					let price = priceCalc(product[key].price, category[0].markup, product[key].amount)
					holiday.then(holidays => {
                        if(category[0].sale){
	                        for (let counter in holidays) {
	                            if (holidays[counter].month == date.getMonth() + 1) {
	                                if (holidays[counter].day == date.getDate()) {
	                                    let temp = price
	                                    temp *= (100 - holidays[counter].discount) / 100
	                                    if(temp > product[key].min_price){
	                                        price = temp
	                                    }else{
	                                        price = parseInt(product[key].min_price)
	                                    }
	                                    break
	                                }
	                            }
	                        }
	                    }
						field.innerHTML += `
						<div class="product">
							<img class="prod_img" src="${img_keeper}">
							<div class="prod_text">
								<div class="name">${product[key].name}</div><br>
								<div class="price">${price.toFixed(2)} UAH</div><br>
							</div>
						</div>
						`
					})
				})
			}
		}
	})
}

function buttonUsed(products, obj) {
	const searchValue = document.querySelector('.search_area').value
	const checkArr = document.querySelectorAll('.check')
	console.log('Search input:', searchValue.toLocaleLowerCase().trim())
	console.log('Check box array', checkArr)
	products.innerText = ''

	console.log(checkArr)

	let flag = false;
	for (i in checkArr) {
		if (checkArr[i].checked) {
			fillContent(products, obj, searchValue.toLocaleLowerCase().trim(), checkArr[i].value)
			flag = true
		}
	}
	if (!flag) {
		fillContent(products, obj, searchValue.toLocaleLowerCase().trim())
	}

	setTimeout(() => {
		if (products.children.length == 0) {
			products.innerHTML = `<div class="prod_err">Product is not found</div>`
		}
	}, 2000)
}


const objUrl = URL + 'food'
const products = document.querySelector('.products')
const dataObject = sendRequest(objUrl)

fillContent(products, dataObject)

const categoryUrl = URL + 'category'
const category = document.querySelector('.categories')
const dataCategory = sendRequest(categoryUrl)

fillCategory(category, dataCategory)

const buttonSearch = document.querySelector('.search_button')
if (!buttonSearch) {
	console.log("no buttonSearch object found!")
} else {
	buttonSearch.addEventListener("click", event => buttonUsed(products, dataObject))
}


document.querySelector('.search_area').addEventListener('keydown', (event) => {
	if (event.keyCode == 13) {
		buttonSearch.click()
		console.log('Ты наконец правильно сделал Cntr+C Cntr+V Tokech')
	}
})