document.addEventListener('DOMContentLoaded', function () {
    buildGroupedExpenses(User)
    getUserExpenses(User)
    addCategoriesToForm()
    // addEventListenerToExpenseForm(User)
})


const BASE_URL = "http://localhost:3000"
const USERS_URL = `${BASE_URL}/users`
const CATEGORIES_URL = `${BASE_URL}/categories`
const GROUPED_EXPENSES_URL = `${USERS_URL}/expenses_by_categories`
const User = {};
User['id'] = 5;
User['name'] = 'Alena';
User['budget'] = 1000.00;


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
    let editBtn = document.createElement('button')
    let deleteBtn = document.createElement('button')

    tr.id = `expense-${expense.id}`
    editBtn.id = `edit-exp-${expense.id}`
    deleteBtn.id = `delete-exp-${expense.id}`

    editBtn.textContent = 'Edit'
    deleteBtn.textContent = 'Delete'

    deleteBtn.addEventListener('click', () => deleteExpense(expense.id))

    description.textContent = expense.description
    amount.textContent = `$${expense.amount}`
    date.textContent = expense.date
    category.textContent = expense.category.name

    tr.append(description, amount, date, category, editBtn, deleteBtn)
    tableBody.appendChild(tr)
}

function deleteExpense(id){
    fetch(`http://localhost:3000/expenses/${id}`,{
    method:'DELETE'
  })
  .then(res => res.json())
  .then(() => {
    let expense = document.getElementById(`expense-${id}`)
    expense.remove()
  })
}

// function addCategoriesToForm(){
    
//     fetch(CATEGORIES_URL)
//     .then(res => res.json())
//     .then(categories => {
//         categories.forEach(cat => addCategory(cat))
//     })

// }

// function addCategory(category){
    
//     let select = document.querySelector('.form-select')
//     let option = document.createElement('option')

//     option.value = category.id
//     option.textContent = category.name

//     select.appendChild(option)

// }

function addEventListenerToExpenseForm(user){
    let form = document.getElementById("expense-form")
    form.id = user.id
    form.addEventListener('submit', handleExpenseSubmit)
}

function handleExpenseSubmit(e){
    e.preventDefault()
    debugger
    let id = parseInt(e.target.id)

    let newExpense = {
        categoryId: parseInt(e.target.children[7].value),
        userId: id,
        description: e.target.description.value,
        amount: e.target.amount.value,
        date: e.target.date.value
    }

    addNewExpense(newExpense)
}

function addNewExpense(expense){
    fetch(`http://localhost:3000/expenses`,{
    method:'POST',
    headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify(expense)
  })
  .then(res => res.json())
  .then(expense => addExpenseToTable(expense))
}
