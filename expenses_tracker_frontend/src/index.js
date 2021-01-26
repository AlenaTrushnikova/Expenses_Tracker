document.addEventListener('DOMContentLoaded', function () {
    buildGroupedExpenses(User)
})



const BASE_URL = "http://localhost:3000"
const USERS_URL= `${BASE_URL}/users`
const GROUPED_EXPENSES_URL = `${USERS_URL}/expenses_by_categories`
const User = {};
User['id'] = 5;
User['name'] = 'Alena';
User['budget'] = 1000.00;


function buildGroupedExpenses(user) {
    fetch(GROUPED_EXPENSES_URL + `/${user.id}`)
        .then (resp => resp.json())
        .then(groupedCategories => categoriesTable(groupedCategories))
}

function categoriesTable(groupedCategories) {
    let body = document.querySelector('#grouped-expenses-body')

    groupedCategories.categories.forEach(category => {
        let catRow = document.createElement('tr')
        let categoryName = document.createElement('td')
        categoryName.textContent = category.categoryName
        let categoryAmount = document.createElement('td')
        categoryAmount.textContent = category.amount
        catRow.append(categoryName, categoryAmount)
        body.append(catRow)
    })

    let total = document.createElement('tr')
    let expenseTotal = document.createElement("td")
    expenseTotal.innerText = "Total Expenses"
    expenseTotal.className = "fw-bold"
    let expenseAmount = document.createElement('td')
    expenseAmount.textContent = groupedCategories.totalAmount
    expenseAmount.className = "fw-bold"
    total.append(expenseTotal, expenseAmount)
    body.append(total)
}