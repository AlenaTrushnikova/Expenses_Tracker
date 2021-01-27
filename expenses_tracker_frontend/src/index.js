document.addEventListener('DOMContentLoaded', function () {
    buildGroupedExpenses(User)
    getUserExpenses(User)
})

const BASE_URL = "http://localhost:3000"
const USERS_URL = `${BASE_URL}/users`
const GROUPED_EXPENSES_URL = `${USERS_URL}/expenses_by_categories`
const User = {};
User['id'] = 6;
User['name'] = 'Alena';
User['budget'] = 1000.00;



//Expenses by Categories
function buildGroupedExpenses(user) {
    fetch(GROUPED_EXPENSES_URL + `/${user.id}`)
        .then(resp => resp.json())
        .then(groupedCategories => categoriesTable(groupedCategories))
}

function categoriesTable(groupedCategories) {
    let body = document.querySelector('#grouped-expenses-body')

    groupedCategories.categories.forEach(category => {
        let catRow = document.createElement('tr')
        let categoryName = document.createElement('td')
        categoryName.textContent = category.categoryName
        let categoryAmount = document.createElement('td')
        categoryAmount.textContent = `$ ${category.amount.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}`
        catRow.append(categoryName, categoryAmount)
        body.append(catRow)
    })

    let total = document.createElement('tr')
    let expenseTotal = document.createElement("td")
    expenseTotal.innerText = "Total Expenses"
    expenseTotal.className = "fw-bold"
    let expenseAmount = document.createElement('td')
    expenseAmount.textContent = `$ ${groupedCategories.totalAmount.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}`
    expenseAmount.className = "fw-bold"
    total.append(expenseTotal, expenseAmount)
    body.append(total)
}

//All Expenses
function getUserExpenses(user) {

    fetch(`${USERS_URL}/${user.id}`)
        .then(res => res.json())
        .then(user => {
            user.expenses.forEach(expense => addExpenseToTable(expense))
        })
}

function addExpenseToTable(expense) {
    let tableBody = document.getElementById('expenses-table-body')
    let tr = document.createElement('tr')

    let description = document.createElement('td')
    let amount = document.createElement('td')
    let date = document.createElement('td')
    let category = document.createElement('td')
    let tdEditBtn = document.createElement('td')
    let tdDeleteBtn = document.createElement('td')
    let editBtn = document.createElement('button')
    let deleteBtn = document.createElement('button')

    tr.id = `expense-${expense.id}`
    editBtn.id = `edit-exp-${expense.id}`
    editBtn.className = "btn btn-outline-success btn-sm"
    deleteBtn.id = `delete-exp-${expense.id}`
    deleteBtn.className = "btn btn-outline-secondary btn-sm"

    editBtn.textContent = 'Edit'
    deleteBtn.textContent = 'Delete'

    description.textContent = expense.description
    amount.textContent = `$ ${expense.amount.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}`
    date.textContent = expense.date
    category.textContent = expense.category.name
    tdEditBtn.append(editBtn)
    tdDeleteBtn.append(deleteBtn)
    tr.append(description, amount, date, category, tdEditBtn, tdDeleteBtn)
    tableBody.appendChild(tr)
}

